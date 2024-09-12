#!/usr/bin/env bash

# necessary packages for the terminal to work properly
brew install fzf bat exa zoxide fd

BASEDIR=$(dirname $0)
cd $BASEDIR

ln -s ${PWD}/bashrc ~/.bashrc
ln -s ${PWD}/bash_aliases ~/.bash_aliases
ln -s ${PWD}/nvim ~/.config/nvim
ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/wezterm ~/.config/wezterm
ln -s ${PWD}/gitignore_global ~/.gitignore_global
ln -s ${PWD}/gitconfig ~/.gitconfig
ln -s ${PWD}/p10k.zsh ~/.p10k.zsh
