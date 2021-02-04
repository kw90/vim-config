#!/usr/bin/env bash

set -e
. ../helpers.sh

echo_info "Installing Python plus requirements and PyEnv with virtualenv"

sudo pacman -S base-devel openssl zlib xz python python2 ctags

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo_done "Installed PyEnv"

exec $SHELL

echo_info "Cloning virtualenv plugin"

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo_done "Installed PyEnv plus virtualenv plugin successfully"

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshenv

echo_done "Enabled auto-activation of virtualenvs"
