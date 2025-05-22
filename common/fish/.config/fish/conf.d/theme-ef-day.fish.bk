# ef-day Color Palette
set -l foreground 584141
set -l selection 8f8886
set -l comment c9c0b8
set -l red ba2d2f
set -l orange aa4f30
set -l yellow a45a22
set -l green 007a0a
set -l cyan 0f7b8f
set -l pink 8448aa

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
set hydro_symbol_prompt "𝝺" 

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
  --color=fg:#584141,fg+:#63728f,bg:-1,bg+:#c9c0b8
  --color=hl:#A8334C,hl+:#007a0a,info:#8448aa,marker:#0f7b8f
  --color=prompt:#584141,spinner:#584141,pointer:#0f7b8f,header:#8448aa
  --color=border:#63728f,label:#584141,query:#0f7b8f
  --border="rounded"
  --border-label="fzf"
  --border-label-pos="0"
  --preview-window="border-rounded"
  --prompt="> "
  --marker=">"
  --pointer="◆"
  --separator="─"
  --scrollbar="│"'
