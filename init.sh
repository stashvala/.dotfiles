#!/bin/bash

is_installed () {
  for prog in "$@"
  do
    if ! [ -x "$(command -v $prog)" ]; then
    	echo "Error: $prog is not installed!" >&2
    	exit 1
    fi
  done
}

# checks for programs we are configuring
is_installed "nvim" "tmux" "ranger"

# init ranger configs
ranger --copy-config=all

# checks for additional dependecy programs
is_installed "curl" "pip3"

# downloads vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# installs neovim python module
pip3 install --user neovim

# downloads tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# creates symbolic links for all configs
ln -sf $PWD/.tmux.conf ~/.tmux.conf
ln -sf $PWD/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/rc.conf ~/.config/ranger/rc.conf

# install neovim plugs non-interactively using vim-plug 
nvim +'PlugInstall --sync' +qa
nvim +'UpdateRemotePlugin --sync' +qa

# runs tpm install for tmux plugins
. ~/.tmux/plugins/tpm/scripts/install_plugins.sh
