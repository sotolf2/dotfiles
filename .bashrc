#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

##-> DreymaR's SetXKB.sh: Activate layout
setxkbmap -model 'pc105caw-sl' -layout 'no(cmk_ed_us)' -option 'misc:extend,lv5:caps_switch_lock,grp:shifts_toggle,compose:menu,misc:cmk_curl_dh'
##<- DreymaR's SetXKB.sh

export PATH=~/.local/lib/python3.8/site-packages/:$PATH

if [[ $(ps --no-header --pid=$PPID --format=cmd) != "zsh" ]]
then
  exec zsh
fi

#if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
#then
#	exec fish
#fi
