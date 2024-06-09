# Use the specified base image
FROM python:3.11-slim

# Install required packages
RUN apt-get update && apk add --no-cache \
    zsh \
    zsh-vcs \
    fzf \
    zoxide \
    eza \
    tmux \
    stow \
    git \
    nodejs \
    neovim \
    ripgrep \
    build-base \
    wget \
    curl \
    openssh-client \
    # for telegram-upload requires python v3.7-11
    rust \
    cargo

# Upgrade setuptools
RUN pip install --upgrade setuptools

# Clone the NvChad starter repository
RUN git clone https://github.com/NvChad/starter /root/.config/nvim

# Install zinit
RUN zsh -y -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Clone dotfiles from repository
RUN git clone --depth=1 https://github.com/Troublesis/nvchad.git $HOME/dotfiles \
    && cd $HOME/dotfiles

RUN cp ~/dotfiles/.zshrc ~/dotfiles/.zshrc.bak

RUN cp ~/dotfiles/.zshrc.bak ~/.zshrc

# RUN echo "Enter following command to automatically finish initial setup:"
# RUN echo "cd ~/dotfiles && stow --adopt . && cp ~/dotfiles/.zshrc.bak ~/.zshrc && source ~/.zshrc && nvim"

# Set the working directory
WORKDIR /root

# Command to keep the container running
CMD ["zsh"]
