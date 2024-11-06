##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Aliases
alias .. "cd .."
alias cat "bat"
alias cd "z"
alias cl "clear"
alias cp "cp -i"
alias del "trash-put -i"
alias df "df -H"
alias diary "nvim +VimwikiIndex +VimwikiDiaryIndex"
alias etree "eza -T --color=always --icons | less -R"
alias gP "git push"
alias ga "git add"
alias gaa "git add --all"
alias gcam "git commit --all --message"
alias glog "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gp "git pull"
alias grep "grep --color=auto"
alias gst "git status"
alias icat "kitty +kitten icat"
alias in "tw add +in"
alias lg "lazygit"
alias ll "eza -l --git --icons -h"
alias lla "eza -l --git --icons -h -a"
alias load-ICC "sh ~/.color/*.sh"
alias ls "eza --icons"
alias lsa "eza --icons -a"
alias mirrors-update "sudo reflector -c 'United Kingdom' -a 6 --sort rate --save /etc/pacman.d/mirrorlist"
alias mv "mv -i"
alias ncdu "ncdu --color dark"
alias next "tw +next"
alias nv "nvim"
alias pac-autoremove "sudo pacman -Rcs $(pacman -Qdtq)"
alias polybar-restart "sh ~/.config/polybar/launch*"
alias py "python3"
alias rm "rm -i"
alias rnd "tw +rnd"
alias src "source ~/.zshrc"
alias tw "task"
alias v "nvim"
alias wiki "nvim -c VimwikiIndex"
alias yt "ytfzf"

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
# set -g fish_color_selection --background$selection
# set -g fish_color_search_match --background$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment

# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment

## Zoxide
zoxide init fish | source
