# ef-day Color Palette
set -l foreground white
set -l selection black --bold
set -l comment black --dim
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
set hydro_color_pwd $foreground
set hydro_color_git $comment
set hydro_color_start $yellow
set hydro_color_prompt $foreground
set hydro_color_error $red
set hydro_color_duration $yellow
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
  --color=fg:#201f36,fg+:#776f79,bg:-1,bg+:#efe7e7
  --color=hl:#b00234,hl+:#217a3c,info:#a01f64,marker:#2f5f9f
  --color=prompt:#201f36,spinner:#9a6012,pointer:#2f5f9f,header:#a01f64
  --color=border:#776f79,label:#201f36,query:#2f5f9f
  --border="rounded"
  --border-label="fzf"
  --border-label-pos="0"
  --preview-window="border-rounded"
  --prompt="> "
  --marker=">"
  --pointer="◆"
  --separator="─"
  --scrollbar="│"'
