# Steps to initial upload the dotfiles

## Initialize git
`git init`

## Setup github users
```
git config --global user.name "Weihao Hu"
git config --global user.email "bamboo5320@gmail.com"
```

## Add the original git repo url
`git remote add origin git@github.com:Troublesis/dotfile.git`

## Create a new branch
`git checkout -b ubuntu`

## Add submodule if any folder contains another git repo 
`git submodule add <url> .config/nvim`

## Add all files
`git add .`

## Generate ssh key and setup in Github
`ssh-keygen -t ed25519 -C "bamboo5320@gmail.com"`
`cat ~/.ssh/id_xxx`

## Push commit to Github repo
`git commit -m "Initial commit"`
`git push -u origin ubuntu`


