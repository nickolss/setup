# Automação de Setup com Nix e Shell Script

Este repositório visa automatizar o setup de um ambiente de desenvolvimento utilizando **Nix** e **Shell Script**. O script instala e configura ferramentas essenciais como **Neovim**, **htop**, **git**, entre outras.

## 📦 Ferramentas Instaladas

O script instala os seguintes pacotes via **Nix**:

- **Neovim**: Editor de texto altamente configurável e extensível.
- **htop**: Monitor de sistema interativo.
- **Git**: Sistema de controle de versão distribuído.
- **Zoxide**: Navegador de diretórios em linha de comando.
- **Mise**: Ferramenta para automatizar builds.
- **GCC**: Compilador GNU.
- **Lazygit**: TUI para comandos git

## 🚀 Como usar

### Requisitos

Este script é projetado para ser executado em distribuições Linux focado em ferramentas de terminal.

### Passos para Rodar o Script

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/nickolss/setup.git
   cd setup

2. **Execute o script de instalação**: 
    ```bash
    chmod +x install.sh
    ./install.sh
