#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.bashrc.d" ]; then
    echo 'FOUND DIR'
    for file in "$HOME/.bashrc.d"/*.sh; do
	echo "FOUND FILE $file"
        if [ -f "$file" ] && [ -r "$file" ]; then
            source "$file"
        fi
    done
fi

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# Use the up and down arrow keys for finding a command in history
# (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

