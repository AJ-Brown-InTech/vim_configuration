#!/bin/bash

echo "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-macos/bin/nvim -q

echo "installin brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo "Installing nerd fonts..."
# brew tap homebrew/cask-fonts
# brew install font-hack-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-complete-nerd-font
brew install --cask font-aurulent-nerd-font

echo "Installing Astro vim"
cd ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
mkdir user/
cd user/
git clone https://github.com/AJ-Brown-InTech/Astro_config ~/.config/nvim/lua/user

echo "install in vim-plugin manager "
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
