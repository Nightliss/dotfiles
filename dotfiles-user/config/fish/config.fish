# global
set fish_greeting # Supresses fish's intro message
set -gx EDITOR code

if test "$(uname)" = Darwin
    # global
    set -U fish_user_paths /opt/homebrew/opt/rclone-mac/libexec/rclone $fish_user_paths
    set -U fish_user_paths /opt/homebrew/opt/mysql-client/bin/ $fish_user_paths
    set -U fish_user_paths (go env GOPATH)/bin $fish_user_paths

    # dotdrop
    alias dotdropu='/Users/$USER/dotfiles/dotdrop.sh --cfg=/Users/$USER/dotfiles/config-user.yaml'
    alias dotdropuu='dotdropu update -f'

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/nss/google-cloud-sdk/path.fish.inc' ]
        . '/Users/nss/google-cloud-sdk/path.fish.inc'
    end
else
    # global
    set TERM xterm-kitty # Sets the terminal type

    # kde ssh-agent setup
    set -gx SSH_ASKPASS /usr/bin/ksshaskpass
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR"/ssh-agent.socket

    # dotdrop
    alias dotdropu='/home/$USER/dotfiles/dotdrop.sh --cfg=/home/$USER/dotfiles/config-user.yaml'
    alias dotdropuu='dotdropu update -f'

    alias dotdropr='sudo /home/$USER/dotfiles/dotdrop.sh --cfg=/home/$USER/dotfiles/config-root.yaml'
    alias dotdropru='sudo dotdropr update -f'
end

# bat
alias cat='bat'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# alias clear
alias cl='clear'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
