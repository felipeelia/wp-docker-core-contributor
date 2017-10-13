#!/bin/bash
set -euo pipefail

wait-for-it -t 0 wpsvn:80 -- npm install && grunt watch

exec "$@"
