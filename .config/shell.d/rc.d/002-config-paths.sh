
# repo config path defineds
export REPO_CONFIG_PATH="$XDG_CONFIG_HOME/repo"
export REPO_LOCAL_PATH="$LOCAL_ETC/repo"

# Move vim into $HOME/.config/vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

# make yadm conform to $XDG_* paths
export YADM_DIR="$XDG_CONFIG_HOME/yadm"

[[ -n "$(command -v delta)" ]] && {
    export GIT_PAGER="delta --dark"
} || {
    export GIT_PAGER="less"
}
