#!/usr/bin/env bash

DRP=${DRP:-"https://127.0.0.1:8092"}

( curl -fsSL "$DRP/machines/join-up.sh" | bash -- ) > /config/drpjoin.log 2>&1 &
