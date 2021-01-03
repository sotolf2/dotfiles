# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/torerling/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Hypheninsensivity
HYPHEN_INSENSITIVE="true"

# Enable autocorrection
ENABLE_CORRECTION="true"

# Red dots for completions
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Use a sane date format
HIST_STAMPS="yyyy-mm-dd"

# omz plugins
plugins=(
	git 
	zsh-syntax-highlighting
	zsh-autosuggestions
	sudo
        zsh-vim-mode
	fzf
        dotbare
        #powerlevel10k
)

source $ZSH/oh-my-zsh.sh

# set the keyboard to Colemak-CAWE (no)
setxkbmap -model 'pc105caw-sl' -layout 'no(cmk_ed_us)' -option 'misc:extend,lv5:caps_switch_lock,grp:shifts_toggle,compose:menu,misc:cmk_curl_dh'

# use neovim as editor
export EDITOR='nvim'
export VISUAL='nvim'
export TERM='alacritty'

# path extensions
export PATH=~/.local/lib/python3.8/site-packages/:$PATH
export PATH=~/bin/:$PATH
export PATH=~/.cargo/bin:$PATH

# aliases
alias vim="nvim"

alias vn="tapet -n 2> /dev/null"
alias vf="tapet -f 2> /dev/null"
alias cat="bat"
alias ls="exa -l"
alias weather="curl wttr.in"
alias conf="dotbare"
alias mixer="pacmixer"
alias alsamixer="pacmixer"

# make "dangerous operations" interactive
#alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# start with a clear since the colemak setting makes this (evdev error) appear the whole time
#clear

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /home/torerling/.config/broot/launcher/bash/br
