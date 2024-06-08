# update pre-commit hook then pre-commit
alias pap="pre-commit autoupdate && pre-commit install && pre-commit run --all-files"

# pre-commit then commit to github
alias pc='gst && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && pre-commit run --all-files && cz c'

# pre-commit and push to github
alias pcp="pre-commit run --all-files && cz c && gp"

# confirm update all git changes and commit changes
# alias uc='git status && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && gau && pre-commit run --all-files && git status && cz c || echo "Exit"'
alias uc='git status && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && gau && git status && cz c || echo "Exit"'

# git add all then commit
alias ac='git status && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && git add --all && git status && cz c || echo "Exit"'

alias ucp='git status && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && git add --update && git status && cz c && git push || echo "Exit"'

alias acp='git status && echo -n "Confirm update and commit by enter \"y/n\": " && read ans && echo "$ans" | grep -iq "y" && git add --all && git status && cz c && git push || echo "Exit"'

# print nice git log
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Start Interactive Add
alias gai="git add -i"

# Adding Changes Interactively by Partial Path
# git add -p path/to/files/
gapp() {
    git status
    echo "Enter path to add changes interactively:"
    # Enable autocompletion
    autoload -Uz compinit
    compinit
    zmodload zsh/zle
    bindkey '^I' expand-or-complete

    vared -p 'Path: ' -c GIT_PATH
    git add -p "$GIT_PATH"
}

# GIT STUFF

function clone() {
    git clone --depth=1 $1
    cd $(basename ${1%.*})
    yarn install
}
# alias push="git push"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# # git root
# alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
#
#
# alias gitmainormaster="git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1"
# alias main="git checkout \$(gitmainormaster)"
alias master="main"
