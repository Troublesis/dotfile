# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias cs="docker exec -it code-server /bin/zsh"
alias r="source ~/.profile && clear"
alias ea="vi ~/.profile"
alias as="vi ~/.alias/alias.sh"
alias c="clear"
alias dk="cd /volume1/docker/ && clear"
alias dc="vi docker-compose.yaml"

alias d='docker $*'
alias d-c='docker-compose $*'
alias d-b="docker-compose up --build -d"
d-zsh() {
    echo "Enter docker name:"
    read NAME
    docker exec -it $NAME /bin/zsh
}
alias d-d="vi docker-compose.yaml"
alias d-D="vi Dockerfile"
alias d-u="vi docker-compose up -d"
alias dockermem='clear && docker stats --no-stream --format "table {{.Container}}\t{{.Name}}\t{{.MemUsage}}" | sort -k 3 -rh'
