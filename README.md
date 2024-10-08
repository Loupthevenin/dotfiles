## Neovim setup

### Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and *undercurl*:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
  - [iterm2](https://iterm2.com/) **_(Macos)_**
- [Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim)

## Shell setup (macOS & Linux)

- [ZSH](https://www.zsh.org/)
- [Zinit](https://github.com/zdharma-continuum/zinit) Plugin manager
- [P10k](https://github.com/romkatv/powerlevel10k) Shell theme
- [Nerd fonts](https://www.nerdfonts.com/) Jetbrain Mono nerd
- [Eza](https://github.com/eza-community/eza) - `ls` replacement
- [fzf](https://github.com/PatrickF1/fzf.fish) - Interactive filtering

## Installing

- neovim
- nerdfont
- ripgrep
- wezterm/Alacritty
- zsh
- tmux
- fzf

## Links

### Configs

```bash
git clone https://github.com/Loupthevenin/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/tmux ~/.config/tmux
ln -s ~/dotfiles/.config/wezterm ~/.config/wezterm
```

### ZSH

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### Scripts

```bash

```

## Shortcuts

### Neovim

### Wezterm

### Tmux

#### Actions

| Keys                         | Action     |
| ---------------------------- | ---------- |
| <kbd>Ctrl</kbd>+<kbd>T</kbd> | action key |
