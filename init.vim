syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set colorcolumn=120
set ignorecase
set smartcase
set wildmenu
set nowrap
set colorcolumn=120
highlight Comment ctermfg=green

call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'

call plug#end()
