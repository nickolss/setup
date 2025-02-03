#!/bin/bash

# Instala o Neovim
yay -S --needed neovim --noconfirm

# Verifica se a pasta ~/.config/nvim já existe, e se sim, remove-a antes de clonar
if [ -d "$HOME/.config/nvim" ]; then
  echo "Directory ~/.config/nvim already exists. Removing it..."
  rm -rf "$HOME/.config/nvim"
fi

# Clona o setup do Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove o diretório .git dentro de ~/.config/nvim
rm -rf ~/.config/nvim/.git
