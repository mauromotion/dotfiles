# ef-day Color Palette
set -l foreground white
set -l selection black --bold
set -l comment white --dim
set -l black black
set -l red red
set -l green green
set -l yellow yellow
set -l blue blue
set -l magenta magenta
set -l cyan cyan
set -l white white

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_keyword $magenta
set -g fish_color_option $green
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $yellow
set -g fish_color_error $red
set -g fish_color_param $magenta
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $magenta
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Hydro prompt styling
set hydro_color_pwd $blue
set hydro_color_git $comment
set hydro_color_start $yellow
set hydro_color_prompt $magenta
set hydro_color_error $red
set hydro_color_duration $yellow
set hydro_multiline true
# set hydro_symbol_prompt " " 
# set hydro_symbol_prompt "𝝺" 

# Colored man pages
set -g man_blink -o $red
set -g man_bold -o $green
set -g man_underline -u $yellow
set -g man_standout -b $comment

# Style the vim-mode indicator
function fish_mode_prompt
switch $fish_bind_mode
    case default
      set_color --bold $yellow
      echo 'N '
    case insert
      set_color --bold $green
      echo ''
    case replace_one
      set_color --bold $green
      echo 'R '
    case visual
      set_color --bold $yellow
      echo 'V '
    case '*'
      set_color --bold $red
      echo '? '
  end
  set_color $foreground
end

# FZF theme dark theme (doom-one)
set -gx FZF_DEFAULT_OPTS '
--color=fg:#bbc2cf,bg:#282a36,hl:#c678dd --color=fg+:#bbc2cf,bg:-1,bg+:#44475a,hl+:#c678dd --color=info:#ecbe7b,prompt:#98be65,pointer:#51afef --color=marker:#51afef,spinner:#ecbe7b,header:#c678dd'

# FZF theme dark theme (dracula)
# set -gx FZF_DEFAULT_OPTS '
# --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# FZF theme light theme (zenbones)
# set -gx FZF_DEFAULT_OPTS '
#   --color=fg:#2C363C,fg+:#4F5E68,bg:-1,bg+:#CFC1BA
#   --color=hl:#A8334C,hl+:#4F6C31,info:#88507D,marker:#3B8992
#   --color=prompt:#2C363C,spinner:#2C363C,pointer:#3B8992,header:#88507D
#   --color=border:#4F5E68,label:#2C363C,query:#3b8992
#   --border="rounded"
#   --border-label="fzf"
#   --border-label-pos="0"
#   --preview-window="border-rounded"
#   --prompt="> "
#   --marker=">"
#   --pointer="◆"
#   --separator="─"
#   --scrollbar="│"'
