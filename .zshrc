alias cal='cal -m'
alias feh='feh -T default'
alias l=less ls='ls --color=auto --group-directories-first -l' m=man v=vim
alias mount_vimwiki="encfs ~/SpiderOak\ Hive/vimwiki ~/vimwiki"
alias pkg_db_clean="sudo pacman -Sc"
alias adom='urxvt -fn "xft:Hack:size=16" -geometry 80x25 -e adom&|'
alias freenet='sudo systemctl start freenet.service'
alias i2p='sudo systemctl start i2prouter.service'
alias ZZZ=poweroff
alias twister='sudo systemctl start twister.service'
alias pacman_update_mirrors='sudo reflector --verbose --connection-timeout 30 --save /etc/pacman.d/mirrorlist --sort rate -l 5 -p https'
alias wifi_strength='watch -n 1 cat /proc/net/wireless'
alias scanphoto='scanimage --device genesys:libusb:004:002 --format=tiff --depth 16 --resolution 300 --mode Color -p -v > image.tiff'
alias wol_DESKTOP='wol 50:e5:49:5a:9a:72'
alias wol_MEDIACENTER='wol 50:e5:49:5c:ad:f7'


function geeknote_add () {
	geeknote create -t $1 -c "WRITE"
}

function pacman_remove_orphans() {
	if [[ ! -n $(pacman -Qdt) ]]; then
		echo "No orphans to remove."
	else
		sudo pacman -Rs $(pacman -Qdtq)
	fi
}

# sets the LS_COLORS environment variable
eval `dircolors -b`

autoload -U colors && colors

# emacs keymap
bindkey -e

# [Delete] key
bindkey '\e[3~' delete-char

# prompts
#PS1="%(?..%{$fg[red]%}%?%{$reset_color%} )%{$fg[green]%}%n%{$fg_bold[green]%}@%{$fg_no_bold[green]%}%m %{$fg_bold[green]%}(%{$fg_no_bold[green]%}%25<..<%~%<<%{$fg_bold[green]%}) !%{$fg_no_bold[green]%}%! %# %{$reset_color%}"
#RPS1="%(1j.%{$fg_bold[green]%}j%{$fg_no_bold[green]%}%j%{$reset_color%} .)%(2L.%{$fg_bold[green]%}s%{$fg_no_bold[green]%}%L%{$reset_color%}.)"
#PS2="%{$fg[green]%}%_%{$fg_bold[green]%}>%{$reset_color%} "
#PS4="+%N:%i:%_> "
#SPROMPT="%{$fg[green]%}zsh: correct '%{$fg_bold[red]%}%R%{$fg_no_bold[green]%}' to '%{$fg_bold[green]%}%r%{$fg_no_bold[green]%}' [%{$fg_bold[green]%}nyae%{$fg_no_bold[green]%}]?%{$reset_color%} "

READNULLCMD=less

# removed '/' so Ctrl-W now deletes only segments of path
WORDCHARS='*?_-.[]~=&;echo%^(){}<>'

ZBEEP='\e[?5h\e[?5l'

# change directories just by typing their name
setopt auto_cd

# correction
setopt correct

# pattern matching (globbing)
setopt extended_glob
setopt numeric_glob_sort

# completion
autoload -U compinit && compinit
zstyle ':completion:*:messages' format %d
zstyle ':completion:*:warnings' format 'No matches: %d'
zmodload zsh/complist
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# history
HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.zsh_history
setopt extended_history
setopt append_history
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify

EDITOR=vim
GEM_HOME=$(ruby -e 'puts Gem.user_dir')
LESS='-iMqR'
npm_config_prefix=~/.node_modules
RI='-f ansi'
# correct extracting of ZIP archives with Russian filenames
# (requires unzip-natspec from AUR)
UNZIP='-O cp866'

export EDITOR GEM_HOME LESS npm_config_prefix RI UNZIP

remind -h ~/.reminders
envoy
source <(envoy -p)

# tells you which package you need to install when command can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh

# oh-my-zsh settings {{{

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

ZSH_CUSTOM=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoosiast"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# }}}
