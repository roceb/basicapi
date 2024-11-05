#!/usr/bin/env bash
set -e
PARENT_DIR=$(pwd)
source "$PARENT_DIR/.venv/bin/activate"

fastapi run | tee server.log
