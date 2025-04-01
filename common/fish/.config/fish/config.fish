##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Set default editor
set -gx EDITOR nvim 
set -gx VISUAL nvim

# turn on vi mode when the shell starts
fish_vi_key_bindings

set fish_greeting
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

## Aliases & abbreviations
abbr --add bash env -i HOME=$HOME PATH=\"/usr/bin:$(echo $PATH)\" TERM=$TERM /usr/bin/bash --noprofile --norc
abbr --add ga git add
abbr --add gaa git add --all
abbr --add gcam git commit --all --message
abbr --add gP git push
abbr --add gp git pull
abbr --add gst git status
abbr --add gsw git switch
abbr --add refl sudo reflector -c \'United Kingdom\' -a 6 --sort rate --save /etc/pacman.d/mirrorlist
abbr --add src source ~/.config/fish/config.fish
abbr --add vst mullvad status
abbr --add vup mullvad connect
abbr --add vdw mullvad disconnect
alias .. "cd .."
alias cd "z"
alias cl "clear"
alias colemak "setxkbmap gb -variant colemak_dh"
alias cp "cp -i"
alias del "trash-put -i"
alias df "df -H"
alias diary "nvim +VimwikiIndex +VimwikiDiaryIndex"
alias etree "eza -T --color=always --icons | less -R"
alias fastfetch "fastfetch -c examples/10.jsonc"
alias glog "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias grep "grep --color=auto"
alias icat "kitty +kitten icat"
alias in "tw add +in"
alias lg "lazygit"
alias ll "eza -l --git --icons -h"
alias lla "eza -l --git --icons -h -a"
alias load-ICC "sh ~/.icc_color_profiles/*.sh"
alias ls "eza --icons"
alias lsa "eza --icons -a"
alias mv "mv -i"
alias ncdu "ncdu --color dark"
alias next "tw +next"
alias nv "nvim"
alias pac-autoremove "sudo pacman -Rcs $(pacman -Qdtq)"
alias polybar-restart "sh ~/.config/polybar/launch*"
alias py "python3"
alias qwerty "setxkbmap gb"
alias rm "rm -i"
alias rnd "tw +rnd"
alias today "nvim +VimwikiIndex +VimwikiMakeDiaryNote"
alias yesterday "nvim +VimwikiIndex +VimwikiMakeYesterdayDiaryNote"
alias tomorrow "nvim +VimwikiIndex +VimwikiMakeTomorrowDiaryNote"
alias tw "task"
alias v "nvim"
alias wiki "nvim -c VimwikiIndex"
alias y "yazi"
alias yt "ytfzf"

## Source Zoxide
zoxide init fish | source
