***REMOVED***

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
***REMOVED***

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
***REMOVED***

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
***REMOVED***
    echo ""
***REMOVED***
