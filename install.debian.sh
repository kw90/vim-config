#!/bin/bash

. ../helpers.sh

echo_info "Installing Python2 and 3 and neovim"

sudo apt-get install -y python python2.7 neovim nodejs

echo_done "Installed Python and NeoVim"

echo_info "Sym. linking nvim config"

ln -s ~/source/dotfiles/vim ~/.config/nvim

echo_info "Installing nvim plugins and configs"

./venv.sh
sudo npm install -g npm
make test
make install
sudo npm install -g neovim

echo_info "Installing Linters"

sudo npm -g install eslint jshint jsxhint jsonlint stylelint sass-lint
sudo npm -g install raml-cop markdownlint-cli write-good
pip install --user pycodestyle pyflakes flake8 vim-vint proselint yamllint ansible-lint
sudo apt-get install -y shellcheck tidy yamllint

echo_info "Installing tools"
pip3 install vimwiki-markdown

echo_info "Patch existing fonts via installing powerline font collection"

git clone git@github.com:powerline/fonts.git
cd fonts || return

echo_done "Installation succeeded"

nvim -c checkhealth

echo_done "vim config applied"
