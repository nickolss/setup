yay -S --needed zellij --noconfirm

echo '[[ -z "$ZELLIJ" ]] && exec zellij' >>~/.bashrc

mkdir ~/.config/zellij/

rm -rf ~/.config/zellij/config.kdl

cp -f "$PWD/config/zellij.kdl" ~/.config/zellij/config.kdl

zellij --config ~/.config/zellij/config.kdl

source ~/.bashrc
