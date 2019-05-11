# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ ! -f /.flatpak-info ]; then
  export PS1='$(echo -e "\[\033[0m\033[2m\033[40m\] $USER@$HOSTNAME:\[\033[44m\]$(pwd) \[\033[0m\033[32m\] $ \[\033[0m\]")'
fi

alias l="ls -F"
alias ll="ls -lF"

[ -f .bashrc.local.sh ] && . .bashrc.local.sh
