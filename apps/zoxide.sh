yay -S zoxide --needed --noconfirm

# Adiciona o zoxide ao .bashrc
echo 'eval "$(zoxide init bash)"' >>~/.bashrc

# Aplica as mudanças feitas no .bashrc
source ~/.bashrc
