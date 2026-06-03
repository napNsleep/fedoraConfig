# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/.bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/.bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#Set cursor to blinking vertical line
#PROMPT_COMMAND='echo -ne "\e[5 q"; '"$PROMPT_COMMAND"

###########
##aliases##
###########
alias yt-dlp-audio="yt-dlp -f 'bestaudio[ext=m4a]'"
alias fastfetch="clear && fastfetch --logo ~/.fastfetch_logo.png --logo-width 21 --logo-height 10 --logo-padding-left 2 --gpu-hide-type integrated --structure os:kernel:packages:shell:de:wm:display:cpu:gpu:terminal"
alias tmatrix="tmatrix --mode=dense -f 0.5,3.0 --fade"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias kdiscord="ps aux | grep '[d]iscord' | awk '{print \$2}' | xargs kill -9"
alias sfind="sudo find / -iname "$1""
alias cspotify="rm -rf ~/.var/app/com.spotify.Client"
alias set-theme="gsettings set org.gnome.desktop.interface gtk-theme "$@""
alias cat="bat"
alias sobash="source ~/.bashrc"
alias svim="sudoedit"
alias ll="ls -lah"

#############################
##Default EDITOR and VISUAL##
#############################
export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim

################
##git commands##
################
alias gadd="git add"
alias gcommit="git commit -m"
alias gstat="git status"
alias greset="git reset"
alias gundocomm="git reset --soft HEAD~1"
alias gpush="git push -u origin main"


############
##starship##
############
eval "$(starship init bash)"
