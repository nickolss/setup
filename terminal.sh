for app in terminal/*.sh; do
    if [[ -f "$app" ]]; then
        echo "Installing terminal app: $app"
        bash "$app"
    fi
done