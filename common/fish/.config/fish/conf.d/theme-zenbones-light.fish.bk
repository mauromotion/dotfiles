# Zenbones Light Color Palette
set -l foreground 2c363c
set -l selection bbaba3
set -l comment 4f5e68
set -l red a8334c
set -l orange 803d1c
set -l yellow 944927
set -l green 4f6c31
set -l cyan 3b8992
set -l pink 88507d

# Syntax Highlighting Colors
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
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Hydro prompt styling
set hydro_color_pwd $foreground
set hydro_color_git $selection
set hydro_color_start $yellow
set hydro_color_prompt $foreground
set hydro_color_error $red
set hydro_color_duration $comment
set hydro_multiline true

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

# FZF theme
set -gx FZF_DEFAULT_OPTS '
  --color=fg:#2C363C,fg+:#4F5E68,bg:-1,bg+:#CFC1BA
  --color=hl:#A8334C,hl+:#4F6C31,info:#88507D,marker:#3B8992
  --color=prompt:#2C363C,spinner:#2C363C,pointer:#3B8992,header:#88507D
  --color=border:#4F5E68,label:#2C363C,query:#3b8992
  --border="rounded"
  --border-label="fzf"
  --border-label-pos="0"
  --preview-window="border-rounded"
  --prompt="> "
  --marker=">"
  --pointer="◆"
  --separator="─"
  --scrollbar="│"'
