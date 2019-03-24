#!/usr/bin/env bash

###
#  if we want to run without "drpjoin" action, set
#  the variable "DRPJOIN_SKIP" to any value
#
#  Set our DRP Endpoint appropriately:
#    * if ARGv1 contains endpoint, use it
#    * if not, try to use RS_ENDPOINT variable
#    * else, prompt for DRP Endpoint
###
DRP=${1:-"$RS_ENDPOINT"}
[[ -z "$DRP" ]] && read -p "Enter DRP Endpoint: " RS
[[ -n "$DRPJOIN_SKIP" ]] && DRPJOIN="" || DRPJOIN="DRP=$DRP"

set -x
docker run -e $DRPJOIN --rm sygibson/vmtools

