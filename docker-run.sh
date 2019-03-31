#!/usr/bin/env bash


[[ -z "$RS_ENDPOINT" ]] && read -p "Enter DRP Endpoint: " RS
EXTRA_ARGS="$*"

set -x
docker run $EXTRA_ARGS -it --rm sygibson/vmtools /usr/bin/drpjoin $RS_ENDPOINT

