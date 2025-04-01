# Poimandres Color Palette
set -l foreground e4f0fb
set -l selection 506477
set -l comment 767C9d
set -l red D0679D
set -l orange F6B486
set -l yellow FFFAC2
set -l green 5DE4C7
set -l cyan 89DDFF
set -l pink FCC5E9

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
set -g fish_color_selection --background$selection
set -g fish_color_search_match --background$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Hydro prompt styling
set hydro_color_pwd $cyan
set hydro_color_git $pink
set hydro_color_start $yellow
set hydro_color_prompt $green
set hydro_color_error $red
set hydro_color_duration $yellow
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
