#!/usr/bin/env bash

if [[ -z "$1" ]]
then
	[[ -z "$RS_ENDPOINT" ]] && read -p "Enter DRP Endpoint: " DRP || DRP=$RS_ENDPOINT
else
	DRP=$1
	shift
fi

# fixup if we get HTTPS API endpoint version - to use the files
# on the HTTP
DRP=$(echo $DRP | sed -e 's/https:/http:/g' -e 's/:8092/:8091/g')

EXTRA_ARGS="$*"

set -x
docker run $EXTRA_ARGS -it --rm sygibson/vmtools /usr/bin/drpjoin $DRP

