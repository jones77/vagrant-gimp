#!/bin/bash
set -e
source /build/buildconfig
echo "Configuring environment."
set -x

BASENAME=`basename $0`

#configure apt for passwordless auth
/build/apt/install.sh

#prepare and update system
/build/tryscript.sh apt-get upgrade
/build/tryscript.sh apt-get install \
    \
    git \
    vim \
    \
# end

for component in \
    \
    configure \
    kde \
    tmux
do
    echo "$BASENAME Installing $component"
    /build/tryscript.sh /build/${component}/install.sh
done

cp -f /build/motd /etc/
