#!/bin/bash

. ../helpers.sh

echo_info "Installing Python2 and 3 and respective virtualenv"

sudo pacman -S python python2 neovim python3-venv python2-venv

echo_done "Installed Python and NeoVim"

echo_info "Sym. linking nvim config"

ln -s ~/source/dotfiles/vim ~/.config/nvim

echo_info "Installing nvim plugins and configs"
./venv.sh
make test
make install
sudo npm install -g neovim

echo_info "Installing Linters"
npm -g install jshint jsxhint jsonlint stylelint sass-lint
npm -g install raml-cop markdownlint-cli write-good
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint
sudo pacman -S shellcheck tidy

nvim -c checkhealth

echo_done "vim config applied"
