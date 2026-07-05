eval "$(fzf --bash)"

# Set a stylish layout, colors, and border
export FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --margin=1% --padding=1% --color=dark"

# Use 'fd' instead of default find for faster, git-aware searching
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# Enable file previews
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -50'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=alwasy {} | head -50'"
