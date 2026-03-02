#!/bin/sh

set -eu

DATA_DIR="/app/data"
LOGS_DIR="${DATA_DIR}/logs"

mkdir -p "${DATA_DIR}" "${LOGS_DIR}"

if [ "$(id -u)" -eq 0 ]; then
  chown -R node:node "${DATA_DIR}"
  exec gosu node "$@"
fi

exec "$@"
