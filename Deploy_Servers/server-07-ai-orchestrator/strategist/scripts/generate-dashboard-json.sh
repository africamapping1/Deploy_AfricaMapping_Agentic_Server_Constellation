#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
STATE_FILE="$BASE/deployment-state/constellation-status.json"
SETTLED_STATE_FILE="$BASE/deployment-state/constellation-status-settled.json"
READ_STATE_FILE="$STATE_FILE"

if [ -f "$SETTLED_STATE_FILE" ]; then
  READ_STATE_FILE="$SETTLED_STATE_FILE"
fi

OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"
OUTPUT_FILE="$OUTPUT_DIR/latest-dashboard.json"

VALIDATION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
DECISION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
INFRA_FILE="$BASE/infrastructure/latest-health.txt"
TENANTS_DIR="$BASE/tenants"

mkdir -p "$OUTPUT_DIR"

python3 <<'PY' > "$OUTPUT_FILE"
import json
import os
import re
from pathlib import Path

BASE = Path("/opt/africamapping")
STATE_FILE = Path("/opt/africamapping/deployment-state/constellation-status.json")
SETTLED_STATE_FILE = Path("/opt/africamapping/deployment-state/constellation-status-settled.json")
READ_STATE_FILE = SETTLED_STATE_FILE if SETTLED_STATE_FILE.exists() else STATE_FILE

VALIDATION_FILE = Path("/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md")
DECISION_FILE = Path("/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md")
INFRA_FILE = Path("/opt/africamapping/infrastructure/latest-health.txt")
TENANTS_DIR = Path("/opt/africamapping/tenants")

def parse_kv_file(path: Path):
    data = {}
    if not path.exists():
        return data
    with path.open() as f:
        for raw in f:
            line = raw.strip()
            if "=" in line:
                k, v = line.split("=", 1)
                data[k] = v
    return data

def read_state_heartbeat():
    if READ_STATE_FILE.exists():
        try:
            return json.loads(READ_STATE_FILE.read_text()).get("heartbeat_state", "unknown")
        except Exception:
            pass
    return "unknown"

def read_validation_result():
    if VALIDATION_FILE.exists():
        m = re.search(r"RESULT=([A-Z_]+)", VALIDATION_FILE.read_text())
        if m:
            return m.group(1)
    return "UNKNOWN"

def read_governor_decision():
    if DECISION_FILE.exists():
        lines = [line.strip() for line in DECISION_FILE.read_text().splitlines() if line.strip()]

        for line in lines:
            if line.startswith("APPROVED:") or line.startswith("REJECTED:"):
                return line

        if lines:
            return lines[-1]

    return "UNKNOWN"


def read_infra():
    restart_required = False
    gpu = "unknown"

    if INFRA_FILE.exists():
        text = INFRA_FILE.read_text()
        if "Restart required." in text and "No restart required." not in text:
            restart_required = True
        if "No GPU detected." in text:
            gpu = "none"
        else:
            m = re.search(r"GPU[^\\n:]*:?\s*(.+)", text)
            if m:
                gpu = m.group(1).strip()

    return restart_required, gpu

projects = []
programs = []

realestate_projects = []

for tenant_dir in sorted(TENANTS_DIR.iterdir()):
    if not tenant_dir.is_dir():
        continue

    tenant_name = tenant_dir.name

    flow03 = tenant_dir / "flows" / "flow-03"
    flow04 = tenant_dir / "flows" / "flow-04"

    tenant_projects = {}

    if flow03.exists():
        for path in sorted(flow03.glob("*-processed.txt")):
            data = parse_kv_file(path)
            if "project_id" not in data:
                continue

            local_id = data.get("project_id", path.stem.replace("-processed", ""))
            global_id = data.get("global_project_id", f"{tenant_name}:{local_id}")

            item = {
                "id": global_id,
                "local_id": local_id,
                "tenant_id": data.get("tenant_id", tenant_name),
                "name": data.get("name", local_id),
                "status": data.get("status", "unknown"),
            }
            projects.append(item)
            tenant_projects[local_id] = global_id

            if tenant_name == "realestate-ai":
                price = float(data.get("price", "0") or "0")
                expected_rent = float(data.get("expected_rent", "0") or "0")
                annual_income = expected_rent * 12
                roi = round((annual_income / price) * 100, 2) if price > 0 else 0.0

                realestate_projects.append({
                    "local_id": local_id,
                    "global_id": global_id,
                    "name": data.get("name", local_id),
                    "status": data.get("status", "unknown"),
                    "price": price,
                    "expected_rent": expected_rent,
                    "annual_income": annual_income,
                    "roi": roi
                })

    if flow04.exists():
        for path in sorted(flow04.glob("*-processed.txt")):
            data = parse_kv_file(path)
            if "program_id" not in data:
                continue

            local_program_id = data.get("program_id", path.stem.replace("-processed", ""))
            global_program_id = data.get("global_program_id", f"{tenant_name}:{local_program_id}")

            raw_projects = []
            text = path.read_text().splitlines()
            capture = False
            for line in text:
                stripped = line.strip()
                if stripped == "projects:":
                    capture = True
                    continue
                if capture:
                    if stripped.startswith("- "):
                        local_ref = stripped[2:].strip()
                        raw_projects.append(tenant_projects.get(local_ref, f"{tenant_name}:{local_ref}"))
                    elif stripped and not stripped.startswith("- "):
                        capture = False

            programs.append({
                "id": global_program_id,
                "local_id": local_program_id,
                "tenant_id": data.get("tenant_id", tenant_name),
                "name": data.get("name", local_program_id),
                "status": data.get("status", "unknown"),
                "projects": raw_projects
            })

heartbeat_state = read_state_heartbeat()
validation_result = read_validation_result()
governor_decision = read_governor_decision()
restart_required, gpu = read_infra()

alerts = []
if validation_result != "PASS":
    alerts.append("Program-project relationship issue detected")

realestate = {
    "total_properties": 0,
    "portfolio_value": 0,
    "monthly_income": 0,
    "annual_income": 0,
    "average_roi": 0.0,
    "estimated_yield_percent": 0.0,
    "portfolio_risk": "unknown",
    "performance_trend": "unknown",
    "occupancy_status": "unknown",
    "recommendation": "NO DATA",
    "best_opportunity": "none",
    "lowest_yield": "none"
}

if realestate_projects:
    total_properties = len(realestate_projects)
    portfolio_value = sum(p["price"] for p in realestate_projects)
    monthly_income = sum(p["expected_rent"] for p in realestate_projects)
    annual_income = sum(p["annual_income"] for p in realestate_projects)
    average_roi = round(sum(p["roi"] for p in realestate_projects) / total_properties, 2)
    estimated_yield = round((annual_income / portfolio_value) * 100, 2) if portfolio_value > 0 else 0.0

    best = max(realestate_projects, key=lambda p: p["roi"])
    worst = min(realestate_projects, key=lambda p: p["roi"])

    recommendation = "SELECTIVE POTENTIAL"
    if average_roi < 6:
        recommendation = "LIMITED POTENTIAL"
    elif average_roi >= 8:
        recommendation = "STRONG POTENTIAL"

    realestate = {
        "total_properties": total_properties,
        "portfolio_value": int(portfolio_value),
        "monthly_income": int(monthly_income),
        "annual_income": int(annual_income),
        "average_roi": average_roi,
        "estimated_yield_percent": estimated_yield,
        "portfolio_risk": "medium",
        "performance_trend": "up",
        "occupancy_status": "occupied-assumed",
        "recommendation": recommendation,
        "best_opportunity": f'{best["global_id"]} ({best["name"]}) → {best["roi"]:.2f}%',
        "lowest_yield": f'{worst["global_id"]} ({worst["name"]}) → {worst["roi"]:.2f}%'
    }

dashboard = {
"generated_at": __import__("datetime").datetime.now(__import__("datetime").UTC).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "platform": {
        "heartbeat_state": heartbeat_state,
        "governance_health": "unknown"
    },
    "metrics": {
        "projects": len(projects),
        "programs": len(programs)
    },
    "alerts": alerts,
    "projects": projects,
    "programs": programs,
    "realestate": realestate,
    "validation": {
        "result": validation_result
    },
    "governor": {
        "decision": governor_decision
    },
    "infrastructure": {
        "restart_required": restart_required,
        "gpu": gpu
    }
}

print(json.dumps(dashboard, indent=2))
PY

echo "[dashboard] JSON written to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
