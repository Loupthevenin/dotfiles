# Refresh : source ~/.zshrc
# Plugin manager for zsh (ZINIT)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Add Powerlevel10k
# To customize prompt, run 'p10k configure' or edit .p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zi ice from'gh-r' as'program' sbin'**/eza -> eza' atclone'cp -vf completions/eza.zsh _eza'
zi light eza-community/eza
zi ice has'eza' atinit'AUTOCD=1'
zi light z-shell/zsh-eza

# Load completions
autoload -U compinit && compinit

# Keybindings
# Pour l'autocompletion : ctrl e
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion syling (SENSIBLE CASSE)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias t="tmux"
alias tl="tmux ls"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tkss="tmux kill-session -t"

alias py="python3"
alias python="python3"

alias vim="nvim"
alias lvim="vim"

alias ls='eza --icons=always'
alias ll='eza --all --long --icons=always'
alias tree='eza --tree --icons=always'

alias oo='cd ~/obsidian/Loup'

# PATH EXPORTS
export EDITOR=nvim

export PATH="bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
