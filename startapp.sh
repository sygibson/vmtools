#!/usr/bin/env bash

# DRP should be set by "docker run..." as an ENV var
export DRP=${DRP:-"https://127.0.0.1:8092"}

set -x
#mkdir -p /config
echo "DRP Endpoint set to '$DRP'"
( curl -fsSL "$DRP/machines/join-up.sh" | bash -- ) > /tmp/drpjoin.log 2>&1 &
