#!/usr/bin/env bash
# Builds Medizin_II_Lernskript.html. See web/build.py for the actual logic.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
python3 build.py
