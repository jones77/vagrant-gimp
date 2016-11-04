#!/bin/bash
set -e
source /build/buildconfig
set -x
echo "Configuring up APT to default yes and not install recommends." 1>&2
set -x
cp /build/apt/90apt /etc/apt/apt.conf.d/90apt
chown root. /etc/apt/apt.conf.d/90apt
chmod 644 /etc/apt/apt.conf.d/90apt
