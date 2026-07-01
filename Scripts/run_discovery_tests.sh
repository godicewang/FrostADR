#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

swift run FrostMI --discovery-self-test
Scripts/build_app.sh --debug --clean
test -f "$(find "$ROOT_DIR/dist/FrostMI.app" -maxdepth 2 -name agent_fingerprints.json | head -n 1)"
"$ROOT_DIR/dist/FrostMI.app/Contents/MacOS/FrostMI" --discovery-self-test
