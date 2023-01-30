##--------------------------------------------
## ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
## │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
## ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
## * .dot***REMOVED***les * --
## Fish terminal -- con***REMOVED***g.***REMOVED***sh --------------

## Aliases
alias nv="nvim"
alias vim="nvim"
alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias gs="git status"
alias lg="lazygit"
alias grep="grep --color=auto"
alias df="df -H"

## rbenv autostart & PATH
set -x PATH $PATH ~/.rbenv/bin
rbenv init - | source

## Greeting message
function ***REMOVED***sh_greeting
	echo --------------------------------
	echo ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
	echo │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
	echo ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
	echo --------- Fish Shell -----------	
	echo 
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
	echo
end

# note: this erases the default ***REMOVED***sh_mode_prompt, which adds a vi mode
# indicator to the left of your prompt
function ***REMOVED***sh_mode_prompt; end

# turn on vi mode when the shell starts
#***REMOVED***sh_vi_mode
