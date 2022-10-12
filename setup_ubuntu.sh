#!/bin/bash

sudo apt update
sudo apt install -y curl git htop mc vim

#install ZSH
sudo apt install -y zsh
sudo apt install -y fonts-powerline
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"agnoster\"/g" ~/.zshrc 
sed -i "s/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g" ~/.zshrc
sed -i "1i DEFAULT_USER=\"\$USER\"" ~/.zshrc

sudo chsh -s /usr/bin/zsh
