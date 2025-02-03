if [[ -n "$DISPLAY" || -n "$WAYLAND_DISPLAY" ]]; then
    for app in desktop/*.sh; do
        if [[ -f "$app" ]]; then
            echo "Installing desktop app: $app"
            yay -S --needed flatpak --noconfirm
            bash "$app"
        fi
    done
else
    echo "No graphical interface detected. Skipping graphical applications."
fi