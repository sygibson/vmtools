#!/bin/bash
# get vmwtools files/ blobs

set -e
set -x

BASE="http://get.rebar.digital/artifacts/vmtools"
TOOLS="VMware-ovftool-4.2.0-5965791-lin.x86_64.bundle
VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz
VMware-vSphereSDK-6.5.0-4571253.zip
VMware-vix-disklib-6.5.0-4604867.x86_64.zip
vsan-sdk-65-java-4602587.zip
vsan-sdk-65-perl-4602587.zip
vsan-sdk-65-python-4602587.zip
vsan-sdk-65-ruby-4602587.zip"

mkdir -pv files

function cmd() { echo "CMD: $*"; $*; }

for TOOL in $TOOLS
do
    cmd curl $BASE/$TOOL -o files/$TOOL
done
