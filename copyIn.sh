#!/bin/sh
cd ~/Downloads
sudo pacman -Syyu
sudo pacman -S zsh alacritty git dunst neovim rofi qtile bluez-utils pulsemixer pulseaudio 
echo "zsh" >> ~/.bashrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bashrc
source ~/.bashrc
nvm install 14.17.5
nvm use 14.17.5
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
source ~/.zshrc

git clone https://github.com/kiddae/feh-blur-wallpaper.git && cd feh-blur-wallpaper && sudo mv feh-blur /usr/bin/ && cd .. && rm -rf feh-blur-wallpaper
sudo chmod +x /usr/bin/feh-blur
echo "alias feh-blur='sh /usr/bin/feh-blur'" >> ~/.zshrc
feh --bg-scale ~/images/dnord4k_dark.png
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "eval "$(starship init zsh)"" >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

git clone https://aur.archlinux.org/eww-git.git && cd eww-git && makepkg -si 
# X
yay -S xorg-server xorg
# Wayland
# Video Drivers
yay -S xf86-video-amdgpu
# Video Acceleration
yay -S libva-mesa-driver
## Info:
# https://wiki.archlinux.org/index.php/xorg#Driver_installation
# https://wiki.archlinux.org/index.php/Hardware_video_acceleration

# Display manager:
# GDM (Wayland compatible)
# Lightdm (Not Wayland compatible)

# Audio
yay -S alsa-utils pulseaudio-alsa pamixer pulsemixer pavucontrol
# Bluetooth
yay -S bluez bluez-utils pulseaudio-bluetooth
## Info:
# https://wiki.archlinux.org/index.php/PulseAudio

# Fonts
yay -S ttf-fira-code nerd-fonts-fira-code

#GTK/QT

yay -S redshift-gtk nautilus lib32-gtk3 blueberry
#Install vscode
git clone https://aur.archlinux.org/visual-studio-code-bin.git && cd visual-studio-code-bin && makepkg -si && cd .. && rm -rf visual-studio-code-bin
#Install pomotroid
git clone https://aur.archlinux.org/pomotroid-bin.git && cd pomotroid-bin && makepkg -si && cd .. && rm -rf pomotroid-bin
sudo chown -R $(whoami) $(where code)
# Juicers
yay -S  ffmpeg mpv  lxappearance 
sudo chmod +s /usr/bin/light

# EWW: https://elkowar.github.io/eww/main/
# River: https://github.com/ifreund/river/


timedatectl set-local-rtc 0
git config credential.helper store
git config --global user.email 'caophuoclong1@gmail.com'
git config --global user.name 'caophuoclong'
