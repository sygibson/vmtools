#!/bin/bash

EXTRA_BUILD_OPTIONS=${1:-""}
STDOUT_LOG=/tmp/docker-build-stdout.$$.txt
STDERR_LOG=/tmp/docker-build-stderr.$$.txt

echo "############################################################"
echo "##"
echo "##  STDOUT log:  $STDOUT_LOG"
echo "##  STDERR log:  $STDERR_LOG"
echo "##"
echo "############################################################"
echo ""

#exec > ${STDOUT_LOG} 2> >(tee ${STDERR_LOG} >&2)
set -x
docker build ${EXTRA_BUILD_OPTIONS} -t sygibson/vmtools .  > ${STDOUT_LOG} 2> >(tee ${STDERR_LOG} >&2)
