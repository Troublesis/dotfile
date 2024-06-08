alias dot="cd ~/dotfiles/"
# tmux
function tssh(){
    SSH_TARGET=$1
    echo "Enter SSH Session name:"
    read SESSION_NAME
    ssh $SSH_TARGET -t "tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME"
}

# Extra package required
# Extra package required
# alias bat="command -v bat > /dev/null 2>&1 && bat || cat"
# alias top="command -v top > /dev/null 2>$1 && btop || top"

# eza
alias tree="eza --tree"
alias treel="eza --tree --long"
alias ls="eza --icons=always"
alias la="eza --icons=always -lah"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

alias ss="source"

# nvim
alias vi="nvim"
vi-p() {
    mkdir -p "$(dirname "$1")" && nvim "$1"
}

test-path() {
    echo "$(dirname "$1")"
}

alias c="clear"
alias cls="clear"

alias ta="type -a"

alias chmox="chmod -x"

alias where=which # sometimes i forget

alias hosts="sudo $EDITOR /etc/hosts"   # yes I occasionally 127.0.0.1 twitter.com ;)

# File size
alias fs="stat -f \"%z bytes\""

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# URL-encode strings
alias urlencode='python3 -c "import sys, urllib as ul; print(ul.quote_plus(sys.argv[1]));"'

# Trim new lines and copy to clipboard
alias ccc="tr -d '\n' | pbcopy"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Get week number
alias week='date +%V'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ssh
#
alias sshkey='ssh-keygen -t ed25519 -C "bamboo5320@gmail.com"'
# alias pem="ssh-keygen -f my_private_key.txt -m PEM -p"
#
# Copy file from local sent to remote
# scp -P port_number /path/to/local/file username@remote_host:/path/to/remote/directory
# Download file from remote to local
# scp username@remote_host:/path/to/remote/file /path/to/local/directory



#
pem() {
    echo "Input ssh.key path to regenerate key file:"
    # Enable autocompletion
    autoload -Uz compinit
    compinit
    zmodload zsh/zle
    bindkey '^I' expand-or-complete

    vared -p 'ssh.key path: ' -c SSHKEY_PATH
    chmod 600 "$SSHKEY_PATH"
    ssh-keygen -f "$SSHKEY_PATH" -m PEM -p
}
# pem() {
#     echo "Input the sshkey file path to regenerate it as key file:"
#     read -e -r SSHKEY_PATH
#     ssh-keygen -f "$SSHKEY_PATH" -m PEM -p
# }

