#
# My cool bashrc
# (c) vkoskiv, but a lot of this stuff was probably stolen from elsewhere
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always'
export PS1="\[\033[38;5;46m\]> \[$(tput sgr0)\]"
export _JAVA_AWT_WM_NONREPARENTING=1
alias vol='pavucontrol'
alias bt='bluetoothctl'
alias open='xdg-open'
alias make='/usr/bin/make -j8'
alias shot='import png:- | xclip -selection clipboard -t image/png'
alias cbqr='xclip -o -s c | qrencode -o - | feh --force-aliasing -ZF -'
alias vlc='vlc --avcodec-hw=vaapi'
alias gdc='git diff --cached'
alias pacman='pacman --color=auto'
alias feh='feh --keep-zoom-vp'

if [ -n "$DESKTOP_SESSION" ]; then
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
fi

# Custom stuff
export EDITOR=vim
export BROWSER=firefox

# Set a non-asinine history size
# 2024-10-29 - Set to 1mill + other options
# to improve shared history.
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/musl/bin/:/home/vkoskiv/.cargo/bin/:/home/vkoskiv/.bin/

alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias hx='helix'
alias p3='python3'

export STEAMVR_VRENV=/home/vkoskiv/.local/share/Steam/steamapps/common/SteamVR/bin/vrenv.sh
export MOZ_USE_XINPUT2=1

export SHOT_HOST=triton
export SHOT_WWW_PATH=/var/www/vkoskiv/screenshots/
export SHOT_URL_BASE=https://vkoskiv.com/screenshots/

export LS_COLORS="$(vivid generate one-dark)"
# source ~/.bash_preexec.sh
# eval "$(atuin init bash)"
