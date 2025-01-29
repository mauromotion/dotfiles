# ZSH Home dir
export ZSH=$HOME

# Set default editor
export EDITOR=nvim

# Zoxide setup
export PATH=~/.local/bin:$PATH

## -- History configuration -- ##
HISTFILE=$ZSH/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt NO_BANG_HIST

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Miscellaneous general options
setopt auto_cd
setopt auto_list

## -- Prompt Theming -- ##
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

## -- Install Zinit plugin manager -- ##
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Extra completions scripts -- needs to be before compinit
fpath=(~/.zsh.d/ $fpath)

# Initialize completion
autoload -U compinit && compinit

zinit cdreplay -q

## -- Plugins -- ##

# Fzf-tab
zinit light Aloxaf/fzf-tab

# Autosuggestions
zinit wait lucid atload'_zsh_autosuggest_start; unalias zi' light-mode for \
    zsh-users/zsh-autosuggestions

# Syntax Highlighting
zinit ice wait'0' silent
zinit light zdharma-continuum/fast-syntax-highlighting

# Completion
zinit ice wait"1" silent
zinit light zsh-users/zsh-completions

# Fzf plugin utilities
zinit ice wait'2' silent
zinit light unixorn/fzf-zsh-plugin

# Vim mode
# zinit snippet OMZP::vi-mode
zinit light jeffreytse/zsh-vi-mode
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')

# Oh-My-zsh plugins
zinit snippet OMZP::cp
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found

## -- Plugins settings -- ##

# Fzf set up
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

## -- Fzf theme -- ##
# # Catppuccin Mocha
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --multi"

# Tokyonight Night
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#d0d0d0,fg+:#C0CAF5,bg:-1,bg+:#292E42
#   --color=hl:#7AA2F7,hl+:#73DACA,info:#BB9AF7,marker:#9ECE6A
#   --color=prompt:#F7768E,spinner:#E0AF68,pointer:#BB9AF7,header:#73DACA
#   --color=border:#414868,label:#E0AF68,query:#BB9AF7
#   --border="rounded" --border-label="fzf" --border-label-pos="0" --preview-window="border-rounded"
#   --prompt="> " --marker=">" --pointer="◆" --separator="─"
#   --scrollbar="│"'

# Poimandres 
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#E4F0FB,fg+:#FFFFFF,bg:-1,bg+:#303340
  --color=hl:#D0679D,hl+:#89DDFF,info:#ebcb8b,marker:#5DE4C7
  --color=prompt:#FCC5E9,spinner:#5DE4C7,pointer:#5DE4C7,header:#8fbcbb
  --color=border:#303340,label:#81a1c1,query:#d8dee9
  --border="rounded" --border-label="fzf" --border-label-pos="0" --preview-window="border-rounded"
  --prompt="> " --marker=">" --pointer="◆" --separator="─"
  --scrollbar="│"'

# Bat theme
export BAT_THEME="tokyonight_night"

## -- fzf-tab and completion visual settings -- ##
# Load LS_COLORS if not already set
eval "$(dircolors -b)"

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:codium:*' fzf-preview 'eza --tree --level=2 --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'eza --tree --level=2 --color=always $realpath'
# zstyle ':fzf-tab:*' ignore 3
zstyle ':fzf-tab:*' query-string ''
# Customize fzf-tab flags to enforce height, border, and key bindings
zstyle ':fzf-tab:complete:*' fzf-flags \
    --height=40% \
    --preview-window=right:60%:wrap:cycle:border-rounded \
    --color=bg+:#363a4f,spinner:#f4dbd6,hl:#ed8796 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
    --color=border:#5b6078,label:#c6a0f6,query:#b8c0e0 \
    --bind="tab:toggle-down" \
    --bind="ctrl-p:change-preview-window(down,90%,wrap,cycle,border-rounded|hidden|right,50%,wrap,cycle,border-rounded)" \
    --bind="ctrl-v:execute(bat --paging=always --color=always {+})"
## ---------- ##

# Fuzzy matching of completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# zsh-vi-mode settings
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

# eval "pfetch"

## -- Aliases -- ##
alias ..="cd .."
# alias cat="bat"
alias cd="z"
alias cl="clear"
alias colemak="setxkbmap gb -variant colemak_dh"
alias cp="cp -i"
alias del="trash-put -i"
alias df="df -H"
alias diary="nvim +VimwikiIndex +VimwikiDiaryIndex"
alias etree="eza -T --color=always --icons | less -R"
alias fastfetch="fastfetch -c examples/10.jsonc"
alias gP="git push"
alias ga="git add"
alias gaa="git add --all"
alias gcam="git commit --all --message"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gp="git pull"
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
alias mirrors-update="sudo reflector -c 'United Kingdom' -a 6 --sort rate --save /etc/pacman.d/mirrorlist"
alias mv="mv -i"
alias ncdu="ncdu --color dark"
alias next="tw +next"
alias nv="nvim"
alias pac-autoremove="sudo pacman -Rcs $(pacman -Qdtq)"
alias polybar-restart="sh ~/.config/polybar/launch*"
alias py="python3"
alias qwerty="setxkbmap gb"
alias rm="rm -i"
alias rnd="tw +rnd"
alias src="source ~/.zshrc"
alias tw="task"
alias v="nvim"
alias wiki="nvim -c VimwikiIndex"
alias y="yazi"
alias yt="ytfzf"

### ---- This lines must always be at EOF!!! ---- ###

# fnm
export PATH="/home/mauromotion/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# rbenv
eval "$(rbenv init - zsh)"


# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/pure.toml)"
# eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
