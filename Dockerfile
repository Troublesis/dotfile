# Use the specified base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Upgrade pip and setuptools
RUN pip install --upgrade pip setuptools

# Install required packages using apt-get (Debian-based)
RUN apt-get update && apt-get install -y --no-install-recommends \
    zsh \
    fzf \
    zoxide \
    exa \
    tmux \
    stow \
    git \
    nodejs \
    neovim \
    ripgrep \
    build-essential \
    wget \
    curl \
    openssh-client \
    rustc \
    cargo && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the NvChad starter repository
RUN git clone https://github.com/NvChad/starter /root/.config/nvim

# Install zinit
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Add p10k to .zshrc
RUN echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Clone dotfiles from repository
RUN git clone --depth=1 https://github.com/Troublesis/nvchad.git $HOME/dotfiles

# Copy and replace .zshrc
RUN cp ~/dotfiles/.zshrc ~/dotfiles/.zshrc.rep
RUN cp ~/dotfiles/.zshrc.rep ~/.zshrc

# Set the working directory
WORKDIR /root

# Command to keep the container running
CMD ["zsh"]
