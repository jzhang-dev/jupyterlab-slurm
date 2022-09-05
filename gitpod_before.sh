#!/usr/bin/env bash
set -euo pipefail

GID=$(id -g)

export UID GID
envsubst < template.env > .env

chmod +x *.sh
