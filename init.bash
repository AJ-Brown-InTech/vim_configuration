#!/bin/bash

echo "Removing any existing nvim installations..."
rm -rf nvim-macos
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim

echo "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-macos/bin/nvim -q

echo "installin brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing nerd fonts..."
brew tap homebrew/cask-fonts #remove?
brew install font-hack-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-complete-nerd-font
brew install --cask font-aurulent-nerd-font
brew tap homebrew/cask-fonts #remove? 
brew install --cask font-fira-mono-for-powerline   

echo "installing lazy git, using the Tap version which is LTS for homebrew but use (brew install lazygit) for the core installation"
brew update
brew install jesseduffield/lazygit/lazygit

# Check for .zshrc or .bashrc
if [ -f ~/.zshrc ]; then
  rc_file=".zshrc"
elif [ -f ~/.bashrc ]; then
  rc_file=".bashrc"
else
  # Create .zshrc if neither is present
  rc_file=".zshrc"
  touch ~/.zshrc
fi

# Add code to .zshrc or .bashrc
if ! grep -q "lg()" ~/.${rc_file}; then
  echo 'lg() {' >> ~/.${rc_file}
  echo '    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir' >> ~/.${rc_file}
  echo '    lazygit "$@"' >> ~/.${rc_file}
  echo '    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then' >> ~/.${rc_file}
  echo '            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"' >> ~/.${rc_file}
  echo '            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null' >> ~/.${rc_file}
  echo '    fi' >> ~/.${rc_file}
  echo '}' >> ~/.${rc_file}
fi

echo "installing fish..."
brew update
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish


echo "Installing Astro vim"
cd ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
mkdir user/
cd user/
git clone https://github.com/AJ-Brown-InTech/Astro_config ~/.config/nvim/lua/user

echo "installing vim-plugin manager "
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
