# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Flutter
export PATH="$HOME/.fvm_flutter/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $HOME/.aliases

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Mise activation
eval "$(mise activate zsh)"

# autocomplete
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/muhammaddzularsyil/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/muhammaddzularsyil/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/muhammaddzularsyil/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/muhammaddzularsyil/google-cloud-sdk/completion.zsh.inc'; fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/muhammaddzularsyil/.dart-cli-completion/zsh-config.zsh ]] && . /Users/muhammaddzularsyil/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Added by Windsurf
export PATH="/Users/muhammaddzularsyil/.codeium/windsurf/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/muhammaddzularsyil/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
