#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="/opt/africamapping"
PAYLOAD_DIR="$BASE_DIR/Deploy_Servers"
STATE_DIR="$BASE_DIR/deployment-state"
STATE_FILE="$STATE_DIR/constellation-status.json"
LOG_DIR="/var/log/africamapping"
LOG_FILE="$LOG_DIR/deploy.log"

mkdir -p "$BASE_DIR"
mkdir -p "$STATE_DIR"
sudo mkdir -p "$LOG_DIR"
sudo touch "$LOG_FILE"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a "$LOG_FILE"
}

bool_from_status() {
  local status="$1"
  if [ "$status" = "present" ]; then
    echo true
  else
    echo false
  fi
}

server_status() {
  local server_name="$1"
  local server_path="$PAYLOAD_DIR/$server_name"
  if [ -d "$server_path" ]; then
    echo "present"
  else
    echo "missing"
  fi
}

FIRST_DEPLOY=false
if [ ! -f "$STATE_FILE" ]; then
  FIRST_DEPLOY=true
  HEARTBEAT_STATE="initializing"
  log "First-time deployment detected"
else
  HEARTBEAT_STATE="steady"
  log "Existing deployment state detected"
fi

SERVER_00_STATUS=$(server_status "server-00-foundation")
SERVER_01_STATUS=$(server_status "server-01-bastion")
SERVER_02_STATUS=$(server_status "server-02-app")
SERVER_03_STATUS=$(server_status "server-03-db")
SERVER_04_STATUS=$(server_status "server-04-storage")
SERVER_05_STATUS=$(server_status "server-05-ci-cd")
SERVER_06_STATUS=$(server_status "server-06-monitoring")
SERVER_07_STATUS=$(server_status "server-07-ai-orchestrator")
SERVER_08_STATUS=$(server_status "server-08-ai-worker")
SERVER_09_STATUS=$(server_status "server-09-ai-training")

log "Detected constellation server presence"
log "server-00-foundation = $SERVER_00_STATUS"
log "server-01-bastion = $SERVER_01_STATUS"
log "server-02-app = $SERVER_02_STATUS"
log "server-03-db = $SERVER_03_STATUS"
log "server-04-storage = $SERVER_04_STATUS"
log "server-05-ci-cd = $SERVER_05_STATUS"
log "server-06-monitoring = $SERVER_06_STATUS"
log "server-07-ai-orchestrator = $SERVER_07_STATUS"
log "server-08-ai-worker = $SERVER_08_STATUS"
log "server-09-ai-training = $SERVER_09_STATUS"

if [ "$SERVER_00_STATUS" != "present" ] || [ "$SERVER_05_STATUS" != "present" ] || [ "$SERVER_06_STATUS" != "present" ]; then
  HEARTBEAT_STATE="degraded"
fi

cat > "$STATE_FILE" <<JSON
{
  "constellation": "Deploy_AfricaMapping_Agentic_Server_Constellation",
  "initialized": true,
  "first_deploy": $FIRST_DEPLOY,
  "heartbeat_state": "$HEARTBEAT_STATE",
  "last_deploy_result": "success",
  "last_deploy_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "last_flow": "flow-01-bastion-app-db-monitoring",
  "connection_model": "shared-governed-state",
  "servers": {
    "server-00-foundation": { "deployed": $(bool_from_status "$SERVER_00_STATUS"), "status": "$SERVER_00_STATUS" },
    "server-01-bastion": { "deployed": $(bool_from_status "$SERVER_01_STATUS"), "status": "$SERVER_01_STATUS" },
    "server-02-app": { "deployed": $(bool_from_status "$SERVER_02_STATUS"), "status": "$SERVER_02_STATUS" },
    "server-03-db": { "deployed": $(bool_from_status "$SERVER_03_STATUS"), "status": "$SERVER_03_STATUS" },
    "server-04-storage": { "deployed": $(bool_from_status "$SERVER_04_STATUS"), "status": "$SERVER_04_STATUS" },
    "server-05-ci-cd": { "deployed": $(bool_from_status "$SERVER_05_STATUS"), "status": "$SERVER_05_STATUS" },
    "server-06-monitoring": { "deployed": $(bool_from_status "$SERVER_06_STATUS"), "status": "$SERVER_06_STATUS" },
    "server-07-ai-orchestrator": { "deployed": $(bool_from_status "$SERVER_07_STATUS"), "status": "$SERVER_07_STATUS" },
    "server-08-ai-worker": { "deployed": $(bool_from_status "$SERVER_08_STATUS"), "status": "$SERVER_08_STATUS" },
    "server-09-ai-training": { "deployed": $(bool_from_status "$SERVER_09_STATUS"), "status": "$SERVER_09_STATUS" }
  }
}
JSON

log "Heartbeat state written to $STATE_FILE"  
log "Governance Loop starting"
log "Enforcing narrator reason records"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/check-reason-records.sh
log "Narrator reason enforcement passed"

log "Generating deployment preview"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/generate-deployment-preview.sh
log "Deployment preview generated"



log  "Running governed flow-01"
bash /opt/africamapping/Deploy_Servers/server-01-bastion/flows/generate-event.sh
bash /opt/africamapping/Deploy_Servers/server-02-app/flows/process-event.sh
bash /opt/africamapping/Deploy_Servers/server-06-monitoring/flows/observe-event.sh
log "Governed flow-01 completed"


log "Running Flow-02 AfricaMapping activity intake"
bash /opt/africamapping/Deploy_Servers/server-01-bastion/flows/receive-africamapping-activity.sh
bash /opt/africamapping/Deploy_Servers/server-02-app/flows/process-africamapping-activity.sh
bash /opt/africamapping/Deploy_Servers/server-03-db/ops/store-africamapping-activity.sh
bash /opt/africamapping/Deploy_Servers/server-06-monitoring/flows/observe-africamapping-activity.sh
log "Flow-02 AfricaMapping activity intake completed"


log "Running narrator summary"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/narrate-state.sh
log "Narrator summary completed"

log "Generating narrator mode summaries"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/generate-internal-summary.sh
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/generate-operator-summary.sh
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/generate-sales-summary.sh
log "Narrator mode summaries completed"

log "Comparing preview versus actual"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/compare-preview-vs-actual.sh
log "Preview versus actual comparison completed"

log "Writing narrator audit entry"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/write-audit-entry.sh
log "Narrator audit entry written"

log "Generating narrator history summary"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/scripts/generate-history-summary.sh
log "Narrator history summary generated"

log "Running strategist analysis"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/strategist/scripts/analyze-system.sh
log "Strategist analysis completed"

log "Running governor decision"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/governor/scripts/decide-next-step.sh
log "Governor decision completed"

log "Reporting Governance Loop health"
bash /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/governance-loop/report-health.sh
log "Governance Loop health reported"


log "Governance Loop completed"

log "Deployment completed successfully"
cat "$STATE_FILE"

