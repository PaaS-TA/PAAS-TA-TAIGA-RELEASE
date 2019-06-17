#!/bin/bash
echo ************setup-config
echo ${JOB_NAME}
echo ${JOB_DIR}
echo ${PKG_DIR}
echo ${HOME}
echo ************config

cat > ${HOME}/.vimrc <<EOF
set nocompatible

set bs=2
set ts=4
set tw=1000000000

set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
filetype indent off
filetype plugin on

syntax on

set autoindent
set showmatch
set showmode
set mousehide

set nowrapscan
set hlsearch
set incsearch

set fileencoding=utf8
set encoding=utf8
EOF

cat > ${HOME}/.tmux-conf.sh <<EOF
function taiga-runserver {
    session=taiga
        tmux new-session -ds \$session -n servers
        tmux send-keys -t \$session 'taiga-runserver-back' C-m
        tmux attach -t \$session
}

function taiga-runserver-back {
    circusctl stop taiga
    workon taiga
    cd ${HOME}/taiga-back
    python manage.py runserver 127.0.0.1:8001
}
EOF

cat > ${HOME}/.bash_profile <<EOF
[[ -s "\$HOME/.profile" ]] && source "\$HOME/.profile" # Load the default .profile
[[ -s "\$HOME/.ruby-conf.sh" ]] && source "\$HOME/.ruby-conf.sh"
[[ -s "\$HOME/.tmux-conf.sh" ]] && source "\$HOME/.tmux-conf.sh"
EOF
