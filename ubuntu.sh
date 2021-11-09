#!/bin/sh
cd ~/Downloads
sudo apt update
sudo apt install zsh git neovim unzip tar
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "zsh" >> ~/.bashrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
source ~/.zshrc
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "eval "$(starship init zsh)"" >> ~/.zshrc
nvm install 14.17.5
nvm use 14.17.5
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

git config credential.helper store
git config --global user.email 'caophuoclong1@gmail.com'
git config --global user.name 'caophuoclong'

sh ./installFont.sh
