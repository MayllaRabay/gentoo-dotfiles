```bash
#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "󰣇 Installing dotfiles..."

#
# ~/.config
#
mkdir -p ~/.config

for dir in hypr waybar wofi wlogout kitty fastfetch nvim; do
    echo "󰚰 Installing $dir..."
    mkdir -p ~/.config/$dir
    ln -sfn "$DOTFILES_DIR/config/$dir" ~/.config/$dir
done

#
# Home files
#
echo "󰚰 Installing .bashrc..."
ln -sfn "$DOTFILES_DIR/home/.bashrc" ~/.bashrc

#
# Portage
#
echo "󰏖 Installing Portage configuration..."

sudo mkdir -p /etc/portage/package.use
sudo mkdir -p /etc/portage/package.accept_keywords
sudo mkdir -p /etc/portage/package.mask
sudo mkdir -p /etc/portage/package.unmask
sudo mkdir -p /etc/portage/package.license
sudo mkdir -p /etc/portage/repos.conf

sudo ln -sfn "$DOTFILES_DIR/portage/make.conf" /etc/portage/make.conf

sudo cp -rf "$DOTFILES_DIR/portage/package.use/." /etc/portage/package.use/
sudo cp -rf "$DOTFILES_DIR/portage/package.accept_keywords/." /etc/portage/package.accept_keywords/
sudo cp -rf "$DOTFILES_DIR/portage/package.mask/." /etc/portage/package.mask/
sudo cp -rf "$DOTFILES_DIR/portage/package.unmask/." /etc/portage/package.unmask/
sudo cp -rf "$DOTFILES_DIR/portage/package.license/." /etc/portage/package.license/
sudo cp -rf "$DOTFILES_DIR/portage/repos.conf/." /etc/portage/repos.conf/

echo ""
echo "✓ Installation complete!"
echo ""
echo "You may need to reload your shell:"
echo "source ~/.bashrc"
```
