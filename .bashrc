#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

my_PS1() {
	USER_COLOR="\[$(tput setaf 171)\]"
	HOST_COLOR="\[$(tput setaf 51)\]"
	DIR_COLOR="\[$(tput setaf 51)\]"
	SEP_COLOR="\[$(tput setaf 82)\]"
	WHITE="\[$(tput setaf 15)\]"
	RESET="\[$(tput sgr0)\]"
	source ~/.git-prompt.sh
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWCOLORHINTS=true
	GIT='$(__git_ps1 " (%s)")'
	PS1="${DIR_COLOR}\W${WHITE}${SEP_COLOR} $ ${RESET}"
	PROMPT_COMMAND='__git_ps1 "${DIR_COLOR}\W${RESET}" " ${SEP}$ ${RESET}"'
}
my_PS1

# Aliases
alias ls='ls -F --color=auto'
alias ll='ls -laF --color=auto'
alias grep='grep --color=auto'
alias gitlog='git log --graph --decorate --all'

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# Use the up and down arrow keys for finding a command in history
# (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export EDITOR=/usr/bin/nvim

export PATH=$PATH:$HOME/go/bin

. "$HOME/.local/bin/env"

source "/usr/share/fzf/key-bindings.bash"
source "/usr/share/fzf/completion.bash"
