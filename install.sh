#!/bin/bash

ascii_art='
          _____                    _____                _____                    _____                    _____
         /\    \                  /\    \              /\    \                  /\    \                  /\    \
        /::\    \                /::\    \            /::\    \                /::\____\                /::\    \
       /::::\    \              /::::\    \           \:::\    \              /:::/    /               /::::\    \
      /::::::\    \            /::::::\    \           \:::\    \            /:::/    /               /::::::\    \
     /:::/\:::\    \          /:::/\:::\    \           \:::\    \          /:::/    /               /:::/\:::\    \
    /:::/__\:::\    \        /:::/__\:::\    \           \:::\    \        /:::/    /               /:::/__\:::\    \
    \:::\   \:::\    \      /::::\   \:::\    \          /::::\    \      /:::/    /               /::::\   \:::\    \
  ___\:::\   \:::\    \    /::::::\   \:::\    \        /::::::\    \    /:::/    /      _____    /::::::\   \:::\    \
 /\   \:::\   \:::\    \  /:::/\:::\   \:::\    \      /:::/\:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\____\
/::\   \:::\   \:::\____\/:::/__\:::\   \:::\____\    /:::/  \:::\____\|:::|    /      /::\____\/:::/  \:::\   \:::|    |
\:::\   \:::\   \::/    /\:::\   \:::\   \::/    /   /:::/    \::/    /|:::|____\     /:::/    /\::/    \:::\  /:::|____|
 \:::\   \:::\   \/____/  \:::\   \:::\   \/____/   /:::/    / \/____/  \:::\    \   /:::/    /  \/_____/\:::\/:::/    /
  \:::\   \:::\    \       \:::\   \:::\    \      /:::/    /            \:::\    \ /:::/    /            \::::::/    /
   \:::\   \:::\____\       \:::\   \:::\____\    /:::/    /              \:::\    /:::/    /              \::::/    /
    \:::\  /:::/    /        \:::\   \::/    /    \::/    /                \:::\__/:::/    /                \::/____/
     \:::\/:::/    /          \:::\   \/____/      \/____/                  \::::::::/    /                  ~~  
      \::::::/    /            \:::\    \                                    \::::::/    /                    
       \::::/    /              \:::\____\                                    \::::/    /                     
        \::/    /                \::/    /                                     \::/____/                    
         \/____/                  \/____/                                       ~~      
'

echo -e "$ascii_art"

# Pergunta ao usuário se deseja continuar
read -p "Do you want to continue? (y/n) " answer

if [[ ! "$answer" =~ ^[Yy]$ ]]; then
  echo "Operation canceled"
  exit 0
fi

set -e

# Instalando yay se não estiver instalado
if ! command -v yay &>/dev/null; then
  echo "Yay is not installed, installing yay..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
  # Remover o diretório yay após a instalação
  rm -rf yay
else
  echo "Yay is already installed."
fi

# Instala o gum
yay -S --needed gum --noconfirm

# Exibe menu interativo
choice=$(gum choose "📟 Apenas Terminal" "🖥️ Terminal + Gráficos")

case "$choice" in
  "📟 Apenas Terminal")
  echo "Installing terminal apps..."
  source terminal.sh
  ;;

  "🖥️ Terminal + Gráficos")
  echo "Installing terminal and GUI apps..."
  source terminal.sh
  source graphical.sh
  ;;

  *)
  echo "Invalid Option. Exiting..."
  exit 1
  ;;
esac

# Aplica as modificações feitas no bashrc
source ~/.bashrc

echo "✅ Installation completed!"
