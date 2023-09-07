# FZF set up with fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# FZF_BASE
export FZF_BASE=~/.zsh/plugins/fzf-zsh-plugin/
# FZF custom
export FZF_PREVIEW_ADVANCED=true
export FZF_PREVIEW_WINDOW='right:35%:nohidden'

# Zoxide setup
export PATH=~/.local/bin:$PATH

# ---------------------------------------
### ZSH Home
export ZSH=$HOME/.zsh


### ---- History Config ----
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
# ---------------------------------------

# ---- Themes ----
# Pure theme
fpath+=($HOME/.zsh/themes/pure)
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:virtualenv color yellow

## Greeting message
	echo ' -------------------------------- '
	echo ' ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌  '
	echo ' │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││  '
	echo ' ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘  '
	echo ' --------- ZSH Shell -----------	'

# zsh-vi-mode
ZVM_VI_HIGHLIGHT_BACKGROUND=#88c0d0
ZVM_VI_HIGHLIGHT_FOREGROUND=#3b4252

# ---- Aliases ----
alias ~="cd ~/"
alias nv="nvim"
alias v="nvim"
alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias lg="lazygit"
alias grep="grep --color=auto"
alias df="df -H"
alias rn="ranger"
alias polybar-restart="sh ~/.config/polybar/launch*"
alias load-ICC="sh ~/.color/*.sh"
alias pac-autoremove="sudo pacman -Rcs $(pacman -Qdtq)"
alias ll="exa -l --git --icons -h"
alias lla="exa -l --git --icons -h -a"
alias ls="exa --icons"
alias lsa="exa --icons -a"
alias yt="ytfzf"
alias gst="git status"
alias gp="git push"
alias gl="git pull"
alias gcam="git commit --all --message"
alias ga="git add"
alias gaa="git add --all"

# ---- Plugins ----
fpath=(~/.zsh/plugins/zsh-completions/src/ $fpath)
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source ~/.zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
source ~/.zsh/plugins/colorize/clorize.plugin.zsh

eval "$(zoxide init zsh)"
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # This line must always be at the EOF
