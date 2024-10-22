##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Aliases
alias nv="nvim"
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
# function fish_greeting
#     echo --------------------------------
#     echo ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
#     echo │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
#     echo ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
#     echo --------- Fish Shell -----------
#     echo
#     echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
#     echo
# end

# note: this erases the default fish_mode_prompt, which adds a vi mode
# indicator to the left of your prompt
function fish_mode_prompt
end

# turn on vi mode when the shell starts
# fish_vi_mode
fish_vi_key_bindings

# Nightfox Color Palette
# Style: nordfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nordfox/nightfox_fish.fish
# set -l foreground cdcecf
# set -l selection 3e4a5b
# set -l comment 60728a
# set -l red bf616a
# set -l orange c9826b
# set -l yellow ebcb8b
# set -l green a3be8c
# set -l purple b48ead
# set -l cyan 88c0d0
# set -l pink bf88bc

# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment

# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment
