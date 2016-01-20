alias rl='source ~/.zshrc; echo ".zshrc reloaded"'
alias regen='zgen reset;source ~/.zshrc'

alias ls='ls --color=auto -p'
alias ll='ls -la'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~/'

# Global Aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g NUL='&> /dev/null'
alias -g C='| xclip -selection c'

# Prompt if overwriting
alias cp='cp -i'
alias mv='mv -i'

alias sudo='sudo '
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'
alias saar='sudo add-apt-repository'
alias sagr='sudo apt-get remove'
alias e='pantheon-files'
alias e.='pantheon-files .'
alias hs='history | grep -i $1'
alias .f='cd ~/.dotfiles'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'

# Other bash stuff
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias please='sudo $(fc -ln -1)'
alias pnotify="notify-send -i utilities-terminal"

# Apps
alias t="touch"
alias ds="dashing start"
alias djs="dashing-js start"
alias be="bundle exec"
alias mm="middleman"
alias djs="dashing-js start"
alias subla="subl . -a"
alias rsx='sudo killall xbindkeys && sudo xbindkeys && echo "xbindkeys restarted"'

# Zshmarks ==> Bashmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"
