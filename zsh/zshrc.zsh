#!/usr/bin/env bash
# Get zgen
source ~/.zgen/zgen.zsh

export DOTFILES="$HOME/.dotfiles"

# Generate zgen init.sh if it doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh

    # Plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/github
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/kubectl
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load jocelynmallon/zshmarks
    zgen load caarlos0/zsh-mkc
    zgen load caarlos0/zsh-git-sync
    zgen load caarlos0/zsh-add-upstream
    zgen load denolfe/zsh-travis
    zgen load denolfe/zsh-prepend
    zgen load gko/ssh-connect

    zgen load agkozak/zsh-z
    zgen load andrewferrier/fzf-z

    zgen oh-my-zsh plugins/asdf
    zgen load kiurchv/asdf.plugin.zsh

    # These 2 must be in this order
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # Set keystrokes for substring searching
    zmodload zsh/terminfo
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
    bindkey "^k" history-substring-search-up
    bindkey "^j" history-substring-search-down

  	# Warn you when you run a command that you've got an alias for
    zgen load djui/alias-tips

    # Adds aliases to open your current repo & branch on github.
  	zgen load peterhurford/git-it-on.zsh

    # Completion-only repos
    zgen load zsh-users/zsh-completions src

    # Theme
    POWERLEVEL9K_MODE='nerdfont-complete'
    zgen load bhilburn/powerlevel9k powerlevel9k

    # Generate init.sh
    zgen save
fi

POWERLEVEL9K_MODE='nerdfont-complete'
zgen load bhilburn/powerlevel9k powerlevel9k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs command_execution_time date)
POWERLEVEL9K_DATE_FORMAT=%D{%m/%d}
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="cyan"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="234"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="234"
POWERLEVEL9K_VCS_GIT_ICON=""
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=""
# POWERLEVEL9K_VCS_GIT_GITLAB_ICON=""
POWERLEVEL9K_HOME_ICON=""
POWERLEVEL9K_HOME_SUB_ICON=""
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_VCS_STAGED_ICON="\u00b1"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193"
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="234"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="white"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

# History Options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Share history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Increase history size
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Place to stash environment variables
if [[ -a ~/.secrets ]]
then
  source ~/.secrets
fi

# Load functions
for f in $DOTFILES/functions/*; do source $f; done

# Load aliases
for f in $DOTFILES/aliases/*.aliases.*sh; do source $f; done

# Load all path files
for f in $DOTFILES/path/*.path.sh; do source $f; done

export FZF_DEFAULT_OPTS='--reverse --bind 'ctrl-l:cancel''
export FZF_TMUX_HEIGHT=80%
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME='Monokai Extended Bright'

export AWS_PAGER='bat -p'

# Needed for Crystal on mac - openss + pkg-config
if [ `uname` = Darwin ]; then
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
fi

source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash
