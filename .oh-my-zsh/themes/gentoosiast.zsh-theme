if [[ $(tput colors) -eq 256 ]] then
	PS1="%F{40}%n@%m%f %F{46}%B[%~]%b%f %(?..%F{160}(¬ %?%)%f )%F{40}»%f "
	PS2="%F{46}%B%_>%b%f "
else
	
	PS1="%F{green}%n@%m %B[%~]%b%f %(?..%F{red}(¬ %?%)%f )%F{green}»%f "
	PS2="%F{green}%B%_>%b%f "
fi
