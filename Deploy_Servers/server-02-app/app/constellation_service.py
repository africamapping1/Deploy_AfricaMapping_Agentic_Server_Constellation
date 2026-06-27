#!/usr/bin/env python3
"""
Constellation App Server -- minimal proof-of-concept HTTP service.

Demonstrates Constellation as a live, reachable service and as a first
gesture at the middleware / build-intake vision: a tenant (e.g. AfricaMapping)
can submit a project concept here and have it recorded as a pending service
request, instead of that work happening only inside a chat session.

Endpoints:
  GET  /            human dashboard: server status + recent service requests
  GET  /health      plaintext "OK", for uptime checks
  GET  /status      raw JSON of constellation-status.json (if present)
  GET  /requests    JSON list of submitted service requests
  POST /requests     submit a new service request: {"tenant": "...", "concept": "..."}

No third-party dependencies -- stdlib only (http.server, json).
"""
import json
import os
import threading
import uuid
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

BASE_DIR = "/opt/africamapping"
STATUS_FILE = os.path.join(BASE_DIR, "deployment-state", "constellation-status.json")
REQUESTS_FILE = os.path.join(BASE_DIR, "app-state", "service-requests.json")
PORT = int(os.environ.get("CONSTELLATION_PORT", "80"))

_lock = threading.Lock()


def _ensure_requests_file():
    os.makedirs(os.path.dirname(REQUESTS_FILE), exist_ok=True)
    if not os.path.exists(REQUESTS_FILE):
        with open(REQUESTS_FILE, "w") as f:
            json.dump([], f)


def _load_requests():
    _ensure_requests_file()
    with open(REQUESTS_FILE) as f:
        try:
            return json.load(f)
        except json.JSONDecodeError:
            return []


def _save_request(entry):
    with _lock:
        items = _load_requests()
        items.append(entry)
        with open(REQUESTS_FILE, "w") as f:
            json.dump(items, f, indent=2)


def _load_status():
    if not os.path.exists(STATUS_FILE):
        return None
    with open(STATUS_FILE) as f:
        try:
            return json.load(f)
        except json.JSONDecodeError:
            return None


def _now():
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


class Handler(BaseHTTPRequestHandler):
    server_version = "Constellation/0.1"

    def _send_json(self, payload, code=200):
        body = json.dumps(payload, indent=2).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _send_html(self, html, code=200):
        body = html.encode()
        self.send_response(code)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(b"OK")
            return

        if self.path == "/status":
            status = _load_status()
            if status is None:
                self._send_json({"error": "no status file yet"}, code=404)
            else:
                self._send_json(status)
            return

        if self.path == "/requests":
            self._send_json({"requests": _load_requests()})
            return

        if self.path == "/" or self.path == "":
            self._send_html(self._render_dashboard())
            return

        self._send_json({"error": "not found", "path": self.path}, code=404)

    def do_POST(self):
        if self.path != "/requests":
            self._send_json({"error": "not found"}, code=404)
            return

        length = int(self.headers.get("Content-Length", 0))
        raw = self.rfile.read(length) if length else b"{}"
        try:
            payload = json.loads(raw or b"{}")
        except json.JSONDecodeError:
            self._send_json({"error": "invalid JSON body"}, code=400)
            return

        tenant = str(payload.get("tenant", "")).strip()
        concept = str(payload.get("concept", "")).strip()
        if not tenant or not concept:
            self._send_json(
                {"error": "both 'tenant' and 'concept' are required"}, code=400
            )
            return

        entry = {
            "id": str(uuid.uuid4())[:8],
            "tenant": tenant,
            "concept": concept,
            "status": "received",
            "submitted_at": _now(),
        }
        _save_request(entry)
        self._send_json({"accepted": True, "request": entry}, code=201)

    def _render_dashboard(self):
        status = _load_status() or {}
        servers = status.get("servers", {})
        requests_ = list(reversed(_load_requests()))[:10]

        server_rows = "".join(
            "<tr><td>{0}</td><td>{1}</td></tr>".format(
                name, info.get("status", "unknown")
            )
            for name, info in servers.items()
        ) or "<tr><td colspan='2'>no status file yet</td></tr>"

        request_rows = "".join(
            "<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>".format(
                r["id"], r["tenant"], r["concept"], r["status"], r["submitted_at"]
            )
            for r in requests_
        ) or "<tr><td colspan='5'>no service requests yet -- POST to /requests</td></tr>"

        return """<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Constellation -- live</title>
<style>
body {{ font-family: -apple-system, sans-serif; margin: 2rem; color: #1a1a2e; }}
h1 {{ margin-bottom: 0.2rem; }}
.tag {{ color: #4a4a68; }}
table {{ border-collapse: collapse; margin-top: 0.5rem; width: 100%; max-width: 760px; }}
th, td {{ border: 1px solid #ddd; padding: 6px 10px; text-align: left; font-size: 0.9rem; }}
th {{ background: #f4f4f8; }}
code {{ background: #f4f4f8; padding: 2px 5px; border-radius: 3px; }}
</style>
</head>
<body>
<h1>Constellation</h1>
<p class="tag">AI-native cloud platform -- middleware between agentics and the cloud environment. This page is served live from the Linode this repo deploys to.</p>

<h2>Server status</h2>
<table><tr><th>server</th><th>status</th></tr>{0}</table>

<h2>Recent service requests</h2>
<p class="tag">A tenant (e.g. AfricaMapping) brings a concept here instead of building it elsewhere -- <code>POST /requests {{"tenant": "...", "concept": "..."}}</code></p>
<table><tr><th>id</th><th>tenant</th><th>concept</th><th>status</th><th>submitted</th></tr>{1}</table>

<p class="tag">Last rendered: {2}</p>
</body>
</html>""".format(server_rows, request_rows, _now())

    def log_message(self, fmt, *args):
        pass  # keep stdout quiet; systemd journal still captures process output


def main():
    with ThreadingHTTPServer(("0.0.0.0", PORT), Handler) as httpd:
        print("Constellation service listening on 0.0.0.0:{0}".format(PORT))
        httpd.serve_forever()


if __name__ == "__main__":
    main()
