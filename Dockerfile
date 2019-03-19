FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
# Updated s/CLI/Perl-SDK/, Docker, docker-compose, go, pyvmomi, govc, powercli by @sygibson
WORKDIR /root
FILESDIR files

#### ---- Installer Files ---- ####

ARG VSPHERE65_SDK_PERL=VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz
ARG VSPHERE65_MGMT_SDK=VMware-vSphereSDK-6.5.0-4571253.zip
ARG VSPHERE65_AUTOMATION_SDK_RUBY=VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
ARG VSPHERE65_AUTOMATION_SDK_PYTHON=VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
ARG VSPHERE65_AUTOMATION_SDK_PERL=VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
ARG VSPHERE65_AUTOMATION_SDK_JAVA=VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
ARG VSAN65_SDK_RUBY=vsan-sdk-65-ruby-4602587.zip
ARG VSAN65_SDK_PYTHON=vsan-sdk-65-python-4602587.zip
ARG VSAN65_SDK_JAVA=vsan-sdk-65-java-4602587.zip
ARG VSAN65_SDK_PERL=vsan-sdk-65-perl-4602587.zip
ARG VDDK65=VMware-vix-disklib-6.5.0-4604867.x86_64.zip
ARG OVFTOOl42=VMware-ovftool-4.2.0-5965791-lin.x86_64.bundle
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$FILESDIR/$VSPHERE65_SDK_PERL", \
  "$FILESDIR/$VSPHERE65_MGMT_SDK", \
  "$FILESDIR/$VSPHERE65_AUTOMATION_SDK_RUBY", \
  "$FILESDIR/$VSPHERE65_AUTOMATION_SDK_PYTHON", \
  "$FILESDIR/$VSPHERE65_AUTOMATION_SDK_PERL", \
  "$FILESDIR/$VSPHERE65_AUTOMATION_SDK_JAVA", \
  "$FILESDIR/$VSAN65_SDK_RUBY", \
  "$FILESDIR/$VSAN65_SDK_PYTHON", \
  "$FILESDIR/$VSAN65_SDK_JAVA", \
  "$FILESDIR/$VSAN65_SDK_PERL", \
  "$FILESDIR/$VDDK65", \
  "$FILESDIR/$OVFTOOl42", \
  "$FILESDIR/$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

ENV PERL5LIB=/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/sdk:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/runtime:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/samples

# Run Bash when the image starts
CMD ["/bin/bash"]
