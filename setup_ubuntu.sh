#!/bin/bash

sudo apt-get update
sudo apt-get install curl git htop mc vim

#install ZSH
sudo apt install zsh
sudo apt-get install fonts-powerline
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# zsh plugins and configuration
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed "s/^ZSH_THEME=.*/ZSH_THEME=\"agnoster\"/g" ~/.zshrc 
sed "s/^plugins=/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g" ~/.zshrc
sed "1i DEFAULT_USER=\"\$USER\"" ~/.zshrc

sudo chsh -s /usr/bin/zsh
