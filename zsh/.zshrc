# zmodload zsh/zprof

# Set default editor
export EDITOR=nvim

# Zoxide setup
export PATH=~/.local/bin:$PATH

# ZSH Home
export ZSH=$HOME/.zsh

## History configuration ##
#
# History file location
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

## Various tweaks ##
setopt auto_cd
setopt auto_list

#Fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Pretty completions
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true

# Colors autoload for colored man pages
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

# Initialize completion
autoload -Uz compinit
compinit

# Color completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Do menu-driven completion
zstyle ':completion:*' menu select

### --- Multiple Neovim configs selector --- ###
#alias nvim-mauro="NVIM_APPNAME=nvim_mauro nvim"

#function nvims() {
#  items=("default" "nvim_mauro")
#  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#  if [[ -z $config ]]; then
#    echo "Nothing selected"
#    return 0
#  elif [[ $config == "default" ]]; then
#    config=""
#  fi
#  NVIM_APPNAME=$config nvim $@
#}
#
#bindkey -s ^n "nvims\n"
### --------------------------------------- ###

### ---- Theming ---- ###

# Pure theme
fpath+=($HOME/.zsh/themes/pure)
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:branch color cyan
zstyle :prompt:pure:virtualenv color cyan

# zsh-vi-mode
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_HIGHLIGHT_BACKGROUND=#D8A657
  ZVM_VI_HIGHLIGHT_FOREGROUND=#282828
}

### ---- Greeting message ---- ###
	# echo ' -------------------------------- '
	# echo ' ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌  '
	# echo ' │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││  '
	# echo ' ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘  '
	# echo ' --------- ZSH Shell -----------	'


### ---- Aliases ---- ###
alias ..="cd .."
alias cat="bat"
alias cl="clear"
alias cp="cp -i"
alias df="df -H"
alias ga="git add"
alias gaa="git add --all"
alias gcam="git commit --all --message"
alias gl="git pull"
alias gp="git push"
alias grep="grep --color=auto"
alias gst="git status"
alias icat="kitty +kitten icat"
alias in="tw add +in"
alias lg="lazygit"
alias ll="eza -l --git --icons -h"
alias lla="eza -l --git --icons -h -a"
alias load-ICC="sh ~/.color/*.sh"
alias ls="eza --icons"
alias lsa="eza --icons -a"
alias mv="mv -i"
alias nv="nvim"
alias next="tw +next"
alias pac-autoremove="sudo pacman -Rcs $(pacman -Qdtq)"
alias polybar-restart="sh ~/.config/polybar/launch*"
alias py="python3"
alias rm="rm -i"
alias rn="ranger"
alias rnd="tw +rnd"
alias src="source ~/.zshrc"
alias tr="trash -i"
alias trash="trash -i"
alias tree="eza -T"
alias tw="task"
alias v="nvim"
alias wiki="v ~/Notes/VimWiki/index.md"
alias yt="ytfzf"
alias zsh-update="sh ~/.zsh/zsh_plugins_updater.sh"
alias ~="cd ~/"

### ---- Plugins ---- ###

# csh.sh completion
fpath=(~/.zsh/plugins/cht_completion/ $fpath)

# Completion
zstyle ':completion:*' menu select
fpath=(~/.zsh/plugins/zsh-completions/src/ $fpath)
zmodload -i zsh/complist

# Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy Finder
source ~/.zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
# FZF set up with fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Colorize code in terminal
source ~/.zsh/plugins/colorize/colorize.plugin.zsh

# Colored man pages
source ~/.zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh

# fnm
export PATH="/home/mauromotion/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# rbenv
eval "$(rbenv init - zsh)"

# Broot
source /home/mauromotion/.config/broot/launcher/bash/br

### ---- This lines must always be at EOF!!! ---- ###
# Zoxide
eval "$(zoxide init zsh)"

# Syntax Highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Vim mode
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')

###DEBUG###
# zprof

source /home/mauromotion/.config/broot/launcher/bash/br
