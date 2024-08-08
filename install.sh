#!/usr/bin/env bash
BASEDIR=$(dirname $0)
cd $BASEDIR

ln -s ${PWD}/bashrc ~/.bashrc
ln -s ${PWD}/nvim ~/.config/nvim
ln -s ${PWD}/zshrc ~/.zshrc
