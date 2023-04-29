# Personal Dev NeoVim Installation

As a long-time Visual Studio Code user, I wanted to explore NeoVim as a text editor for my development work. However, I didn't want to spend a lot of time configuring it to suit my needs. So, I created this guide to help you fast-track your NeoVim setup and get started with a sleek and organized development environment.

## Installation

The first step is to install NeoVim on your system. Here's a quick bash script you can use to install/setup your neovim environment:

```bash
init.bash
```

Once you have everything installed, you should have a `user/` directory with an `init.lua` file. This file will contain your personal settings and configurations. Copy the `init.lua` file into this directory ```~./config/nvim/user/```

Next, you'll want to add a few lines to the parent `init.lua` file. Open the file with the following command:

```
cd ~/.config/nvim/init.lua
```

Open the file and add the following lines to the file:

```lua
-- Install vim-plug
vim.fn.system({
  'curl', '-fLo',
  vim.fn.stdpath('data') .. '/site/autoload/plug.vim',
  '--create-dirs',
  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
})
-- Set the font to Hack Nerd Font
vim.o.guifont = "FiraCode Nerd Font Mono:h24"
```

This will install the vim-plug package manager and set the font to Hack Nerd Font.

## NeoVim Commands

Now that your NeoVim is set up with basic configurations, you can start installing plugins and setting up your development environment. Here are a few useful commands to get you started:

### Installing LSps

To install LSps, you can use the `LspInstall` command in NeoVim. Here are a few examples of how to install specific LSps(These are actually ones I use):

```vim
:LspInstall gopls
:LspInstall efm-langserver
:LspInstall ccls
:LspInstall clangd
:LspInstall astro
:LspInstall jedi-language-server
:LspInstall pyright
:LspInstall python-language-server
```

### Starting Debuggers

To start a debugger in NeoVim, you can use the `DebugStart` command. Here's an example of how to start a Go debugger:

```vim
:DebugStart debugpy -m myapp.py
```

This will start the `debugpy` debugger with the `myapp.py` file.

### Additional NeoVim Commands

Here are a few additional NeoVim commands that you might find useful:

- `:PlugInstall` - Install plugins
- `:PlugUpdate` - Update plugins
- `:q` - Quit NeoVim
- `:w` - Save the current file

With these basic commands and configurations, you should be able to get started with NeoVim and customize it to suit your development needs. Good luck!# vim_configuration
# vim_configuration
# vim_configuration
# vim_configuration
# vim_configuration
