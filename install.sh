#!/bin/bash

. ../helpers.sh

echo_info "Installing Python2 and 3 and respective virtualenv"

sudo pacman -S python python2 neovim

echo_done "Installed Python and NeoVim"

echo_info "Sym. linking nvim config"

ln -s ~/source/dotfiles/vim ~/.config/nvim

echo_info "Installing nvim plugins and configs"
./venv.sh
make test
make install
sudo npm install -g neovim

echo_info "Installing Linters"
sudo npm -g install jshint jsxhint jsonlint stylelint sass-lint
sudo npm -g install raml-cop markdownlint-cli write-good
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint
sudo pacman -S shellcheck tidy

echo_info "Patch existing fonts via installing powerline font collection"
git clone git@github.com:powerline/fonts.git
cd fonts || return
./install.sh



nvim -c checkhealth

echo_done "vim config applied"
