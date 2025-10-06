#
# ~/.bashrc
#



# ----------------------------------------------------------------------------------------------------------------------------------- #
### If not running interactively, don't do anything
[[ $- == *i* ]] && source -- /usr/share/blesh/ble.sh --attach=none



# ----------------------------------------------------------------------------------------------------------------------------------- #
### Setting all the settings here
# Most of these have info in man bash
export EDITOR=nvim
export SUDO_EDITOR=nvim
HISTCONTROL=ignoreboth		# useful for ignoring commands. Just put a space before a command to stop it from going to history. Also doesn't put duplicates.
HISTSIZE=1000			# Changes the default amount of history saved
HISTFILESIZE=2000
shopt -s histappend		# append stuff to the terminal history instead of overwriting. Useful when using more than 1 terminal.
shopt -s checkwinsize		# updates the size of command output based on window size
LS_COLORS=$LS_COLORS:'di=38;5;200:' ; export LS_COLORS



# ----------------------------------------------------------------------------------------------------------------------------------- #
### Ble.sh settings here
# so I can use vim keymaps in the terminal and stuff
set -o vi

# Set a low KEYTIMEOUT and ttimeout to make Escape key more responsive
export KEYTIMEOUT=1
bind 'set keyseq-timeout 1'

# me like custom words
function my/vim-load-hook {
  bleopt keymap_vi_mode_string_nmap=$'\e[1m-- NORMAL --\e[m'
  source "$_ble_base/lib/vim-surround.sh"
}
blehook/eval-after-load keymap_vi my/vim-load-hook

# to set what cursor is shown in which mode
ble-bind -m vi_nmap --cursor 2
ble-bind -m vi_imap --cursor 5



# ----------------------------------------------------------------------------------------------------------------------------------- #
### Custom titles and stuff goes here
# Only use fancy prompt on color terminals
case "$TERM" in
    xterm-color|*-256color) 
        PROMPT_COMMAND=build_prompt
        ;;
    *)
        PS1='\u@\h:\w\$ '
        ;;
esac

# Set terminal title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
esac

build_prompt() {

    OS='\e[48;5;196;38;5;15m 󰣇 \e[48;5;226;38;5;196m'
    USR="\e[2;48;5;226;38;5;17m  ${USER:0:4} \e[22;48;5;22;38;5;226m"
    CWD_NO_GIT='\e[2;48;5;22;38;5;225m   \W \e[0;38;5;22m'
    RESET='\e[m'

    PS1="$OS$USR"

    # Source git-prompt.sh
    if [ -f /usr/share/git/completion/git-prompt.sh ]; then
        . /usr/share/git/completion/git-prompt.sh

        # Enable git branch name
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWSTASHSTATE=1
        GIT_PS1_SHOWUPSTREAM="auto"


        CWD='\e[48;5;22;38;5;225m   \w \e[48;5;45;38;5;22m'
        GIT_STRING=$(__git_ps1 "%s")
        GIT_TING='\e[48;5;45;38;5;17m  $GIT_STRING \e[0;38;5;45m'

        if [[ -n "$GIT_STRING" ]]; then
            PS1+="$CWD$GIT_TING$RESET "
        else
            PS1+="$CWD_NO_GIT$RESET "
        fi

    else
        echo 'something is wrong with the git stuff'

        PS1+="$CWD_NO_GIT$RESET "

    fi


    # PS1="${debian_chroot:+($debian_chroot)}$OS$USER$CWD$GIT_TING \e[m"
    # here just in case I goof up
    # PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
}

# ----------------------------------------------------------------------------------------------------------------------------------- #
### Setting the aliases here
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi
alias ls='lsd --color=auto'
alias ll='lsd -alF'
alias la='lsd -A'
alias grep='grep --color=auto'
alias updatenow="yau -Syu && flatpak update"
alias discordfix="sudo ~/bin/my_bash_scripts/discordfix"
alias discordfixmanual="sudo nvim /usr/share/discord/resources/build_info.json"
alias gita="git add -A"
alias gitc="git commit -m"
alias gitp="git push origin"
acp () {
    if [ "$#" -ne 2 ]; then
        echo "wrong number of arguments dummy"
        return 1
    fi
    git add -A
    git commit -m "$1"
    git push origin "$2"
}
alias sl="ls|rev"
alias opendrive="~/bin/my_bash_scripts/opendrive"
alias closedrive="~/bin/my_bash_scripts/closedrive"
alias grep='grep --color=auto'


 
# ----------------------------------------------------------------------------------------------------------------------------------- #
### Enabling external things
[[ ! ${BLE_VERSION-} ]] || ble-attach
eval "$(atuin init bash)"
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"



# ----------------------------------------------------------------------------------------------------------------------------------- #
### Wakey wakey terminal
neofetch

