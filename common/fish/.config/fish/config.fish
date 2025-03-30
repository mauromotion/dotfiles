##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Aliases
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
alias load-ICC "sh ~/.icc_color_profiles/*.sh"
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
alias qwerty "setxkbmap gb"
alias rm "rm -i"
alias rnd "tw +rnd"
alias src "source ~/.config/fish/config.fish"
alias tw "task"
alias v "nvim"
alias vst "mullvad status"
alias vup "mullvad connect"
alias vdw "mullvad disconnect"
alias wiki "nvim -c VimwikiIndex"
alias y "yazi"
alias yt "ytfzf"

# ## Greeting message
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


# Poimandres FZF theme
set -gx FZF_DEFAULT_OPTS '
  --color=fg:#E4F0FB,fg+:#FFFFFF,bg:-1,bg+:#303340
  --color=hl:#D0679D,hl+:#89DDFF,info:#ebcb8b,marker:#5DE4C7
  --color=prompt:#FCC5E9,spinner:#5DE4C7,pointer:#5DE4C7,header:#8fbcbb
  --color=border:#303340,label:#81a1c1,query:#d8dee9
  --border="rounded"
  --border-label="fzf"
  --border-label-pos="0"
  --preview-window="border-rounded"
  --prompt="> "
  --marker=">"
  --pointer="◆"
  --separator="─"
  --scrollbar="│"'

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

## Poimandres Color Palette 
set -l foreground e4f0fb
set -l selection 506477
set -l comment 767C9d
set -l red D0679D
set -l orange F6B486
set -l yellow FFFAC2
set -l green 5DE4C7
set -l cyan 89DDFF
set -l pink FCC5E9

# # Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_option $green
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $pink
set -g fish_color_comment $comment
set -g fish_color_selection --background$selection
set -g fish_color_search_match --background$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# # Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment



## Zoxide
zoxide init fish | source
