##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Aliases
alias nv="nvim"
alias vim="nvim"
alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias gst="git status"
alias lg="lazygit"
alias grep="grep --color=auto"
alias df="df -H"
alias rn="ranger"
alias polybar-restart="sh ~/.config/polybar/launch*"
alias load-ICC="sh ~/.color/*.sh"
alias pac-autoremove="sudo pacman -Rcs $(pacman -Qdtq)"
alias manjaro-update="pamac upgrade && pamac upgrade --aur --devel || echo -e '\033[0;91mThere was an error upgrading the system. AUR packages not upgraded.\e[0m'"
alias manjaro-boot-log="journalctl --boot=-1 --priority=3 --catalog --no-pager"
alias ll="exa -l --git --icons -h"
alias lla="exa -l --git --icons -h -a"
alias ls="exa --icons"
alias lsa="exa --icons -a"

## rbenv autostart & PATH
## set -x PATH $PATH ~/.rbenv/bin
## rbenv init - | source
# status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source

## NodeJS PATH
set PATH /home/mauromotion/.nvm/versions/node/v19.5.0/bin $PATH

## Zoxide
set PATH /home/mauromotion/.local/bin $PATH
zoxide init fish | source

## Greeting message
function fish_greeting
    echo --------------------------------
    echo ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
    echo │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
    echo ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
    echo --------- Fish Shell -----------
    echo
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
    echo
end

# note: this erases the default fish_mode_prompt, which adds a vi mode
# indicator to the left of your prompt
function fish_mode_prompt
end

# turn on vi mode when the shell starts
#fish_vi_mode
