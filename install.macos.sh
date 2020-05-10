#!/bin/bash

. ../helpers.sh

echo_info "Installing Python3 and NeoVim"
brew install python neovim
# Overwrite symlinks for Python, such that the system uses Brew installed Python
# version
brew link --overwrite python
echo_done "Installed Python and NeoVim"

echo_info "Sym. linking nvim config and for regular Vim"
ln -s ~/source/dotfiles/vim ~/.vim  # For "regular" Vim
ln -s ~/source/dotfiles/vim ~/.config/nvim

echo_info "Installing pynvim lib and nvim plugins"
pip3 install --user pynvim
make test
make install
echo_done "Installed pynvim and nvim plugins. Checking Python3 availability in nvim"
nvim +'py3 print(sys.version_info)'

echo_info "Installing Nerd Font"
brew tap homebrew/cask-fonts
brew cask install font-fira-code

echo_info "Installing Linters"
brew install shellcheck jsonlint yamllint tflint ansible-lint
brew install tidy-html5 proselint write-good

brew install yarn
yarn global add eslint jshint jsxhint stylelint sass-lint
yarn global add markdownlint-cli raml-cop

pip3 install --user vim-vint pycodestyle pyflakes flake8

echo_info "Installing tools"
brew install the_silver_searcher rg z fzf
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

echo_done "Everything was installed successfully"

nvim -c checkhealth

echo_done "vim config applied"
echo_info "To use auto-completions for languages install the respective
Language-Server Protocol (LSP) using :LspInstallServer"

