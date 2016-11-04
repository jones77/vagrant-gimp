#!/bin/bash
set -e
source /build/buildconfig
#do everything as vagrant user
if [ ! "${USER}" = "vagrant" ]; then
    su - vagrant -c "$0 $@"
    exit
fi
echo "Set up dotfiles" 1>&2
set -x


# github

cd
mkdir -p github
cd github

# configure dotfiles
(
    if [[ ! -d scripts ]]
    then
        git clone https://github.com/jones77/scripts.git
        cd scripts/dotfiles
        ./configure.sh
        vim +PluginInstall +qall
    fi
)

(
    if [[ ! -d fonts ]]
    then
        git clone https://github.com/powerline/fonts.git
        cd fonts
        ./install.sh
    fi
)

