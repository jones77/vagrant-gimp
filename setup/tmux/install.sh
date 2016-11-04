# Needed by autogen.sh
apt-get install \
    autotools-dev automake pkg-config \
    libevent-dev libncurses5-dev libncursesw5-dev

# Build tmux from source
TMUX_DIR=~/github/tmux
if [[ ! -d "$TMUX_DIR" ]]
then

    git clone https://github.com/tmux/tmux.git "$TMUX_DIR"
    cd "$TMUX_DIR"
    sh autogen.sh
    ./configure && make && make install
fi
