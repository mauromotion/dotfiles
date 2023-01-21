##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dotfiles * --
## Fish terminal -- config.fish --------------

## Aliases
alias nv="nvim"

## rbenv autostart & PATH
set -x PATH $PATH ~/.rbenv/bin
rbenv init - | source

## Greeting message
function fish_greeting
	echo --------------------------------
	echo ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
	echo │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
	echo ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
	echo -------- Fish Shell ------------	
	echo 
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end
