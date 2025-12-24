# Start Fresh on New Machine

1. Install zsh
```
# Mac
brew install zsh

# Debian
apt install zsh
```

2. Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Install zsh plugins
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# update .zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

4. Config zsh
```
# create .zshenv file and paste this
export ZDOTDIR="$HOME/.config/zsh"

# move the zsh config to .config folder
mv $HOME/.zshrc $HOME/.config/zsh/.zshrc
```

5. Install helix editor
```
# Mac
brew install helix

# Debian
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
```

6. Install tmux
```
# Mac
brew install tmux

# Debian
apt install tmux
```

7. Clone dotfiles
```
git clone https://github.com/aru-shiru/dotfiles.git
```
