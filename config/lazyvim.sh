#!/bin/bash

# required
mv ~/.config/nvim{,.bak}

# Cloning the lazyVim repository
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Removing the .git in repository
rm -rf ~/.config/nvim/.git
