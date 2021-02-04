#!/bin/bash

. ../helpers.sh

echo_info "Installing Python2 and 3 and respective virtualenv"

# If ~/.pyenv does not exist install it
if [ ! -d ~/.pyenv ]; then
	. ./install-pyenv.sh
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.8.6
pyenv virtualenv 3.8.6 neovim
pyenv activate neovim
pip3 install pynvim

yaourt -S --noconfirm neovim-git

echo_done "Installed NeoVim"

echo_info "Sym. linking nvim config"

ln -s ~/source/dotfiles/vim ~/.config/nvim

echo_info "Installing nvim plugins and configs"
./venv.sh
make test
make install
sudo npm install -g neovim
sudo pacman -S bat fd fzf perl ripgrep the_silver_searcher texlive-most texlive-lang zathura-pdf-poppler gdb universal-ctags
pip3 install debugpy
sudo npm i -g bash-language-server

echo_info "Installing Linters"
sudo npm -g install jshint jsxhint jsonlint stylelint sass-lint
sudo npm -g install raml-cop markdownlint-cli write-good
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint grip
sudo pacman -S shellcheck tidy

echo_info "Installing tools"
pip3 install vimwiki-markdown

echo_info "Installing dependencies from sources"
mkdir -p deps && cd deps || exit

echo_info "Patch existing fonts via installing powerline font collection"
git clone git@github.com:powerline/fonts.git
cd fonts || return
./install.sh
cd ..

echo_info "Installing xdotool for fake keyboard/mouse input, WM and more"
git clone git@github.com:jordansissel/xdotool.git
cd xdotool || return
make
sudo make install
cd ..

echo_done "Everything was installed successfully"

pyenv activate neovim
nvim -c checkhealth

echo_done "vim config applied"
