# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export LC_CTYPE=en_GB.UTF-8

umask 002

export EDITOR=vim

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" == "Mac" ]
then
  alias updatedb="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist"
fi

PATH=/usr/sbin/:/sbin/:/usr/local/bin:/usr/bin:/Users/mrobinson/puppet-ng/administration-tools/bin:$PATH
export PATH

if [ "$TERM" == "screen" ]; then
    export TERM=screen-256color
fi
if [ "$TERM" == "st-256color" ]; then
    export TERM=screen-256color
fi
alias xt='export TERM=xterm'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    #eval "`dircolors -b`"
    alias ls='ls -G'
	PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]:\)\[\e[0m\]; else echo \[\e[31m\]:\(\[\e[0m\]; fi\` ${TITLEBAR}\[\e[0;32m\]\d \[\e[0;31m\]\t\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[1;37m\]\u\[\033[0m\]\[\033[0;33m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0m\]\[\033[0;33m\]:\[\033[0m\]\[\033[1;33m\]\w\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[0;32m\]\[\033[0m\]\[\033[1;37m\]\[\033[0m\]\[\033[1;37m\](\[\033[0m\]\[\033[0;33m\]\$(ls -l | grep \"^-\" | wc -l | tr -d \" \")\[\033[0m\]\[\033[1;37m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[0;37m\]files\[\033[0m\]\[\033[1;37m\], \[\033[0m\]\[\033[0;33m\]\$(ls -si -s | head -1 | awk '{print \$2}') \[\033[0m\]\[\033[0;37m\]total\[\033[0m\]\[\033[1;37m\])(\j)\n\[\033[0m\]\[\033[1;37m\]> \[\033[0;0m\]"
fi

#" Fix vim syntax highlight

# This will cause bash to fix a garbled terminal before the prompt is printed. For example, if you cat a file with nonprintable character sequences, the terminal sometimes ends up in a mode where it only prints line drawing characters. This sequence will return the terminal to the standard character set after every command.
export PS1="\[\017\033[m\033[?9l\033[?1000l\]$PS1"

# extend history
export HISTSIZE=100000
export HISTFILESIZE=999999
export HISTCONTROL=ignoredups

alias ports="sudo ssh -L 3128:10.0.2.1:3128 -L 993:10.0.2.1:993 -L 443:10.0.2.1:443 -D 12345 michaelr@wombat64"
alias ll='ls -latrh'
alias lss='ll'
alias sl='ll'
alias l='ll'
alias t='tmux a || tmux'
# Alias for renaming tmux panes
alias rename-pane='printf "\033]2;%s\033\\"'

alias fixPS1='PS1="\[\017\033[m\033[?9l\033[?1000l\]\[\e[0;32m\]\d \[\e[0;31m\]\t\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[1;37m\]\u\[\033[0m\]\[\033[0;33m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0m\]\[\033[0;33m\]:\[\033[0m\]\[\033[1;33m\]\w\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[0;32m\]\[\033[0m\]\[\033[1;37m\]\[\033[0m\]\[\033[1;37m\](\[\033[0m\]\[\033[0;33m\]X\[\033[0m\]\[\033[1;37m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[0;37m\]files\[\033[0m\]\[\033[1;37m\], \[\033[0m\]\[\033[0;33m\]X \[\033[0m\]\[\033[0;37m\]total\[\033[0m\]\[\033[1;37m\])(\j)\n\[\033[0m\]\[\033[1;37m\]> \[\033[0;0m\]"'
#Deletes the last entry in your history
alias histdel='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'
#netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'
alias tcpCnx='netstat -an | grep ESTABLISHED | awk '\''{print $5}'\'' | awk -F: '\''{print $1}'\'' | sort | uniq -c | awk '\''{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'\'''
alias sshx='ssh -XC -o CompressionLevel=9 '
alias serveThis='python -m SimpleHTTPServer 9876'
alias fgerp='fgrep'
alias sv='source venv/bin/activate'
alias v2='virtualenv -p python2 venv && source venv/bin/activate'
alias v3='python3 -m venv venv && source venv/bin/activate'
alias tv='terminal_velocity'

#tmuxinator
#source ~/.gem/ruby/gems/tmuxinator-0.7.1/completion/tmuxinator.bash

ulimit -c unlimited

#xhost + >/dev/null 2>&1 # Flaky on my Mac for some reason
shopt -s histappend
PROMPT_COMMAND='history -a'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

#dir colours for ls
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'*.py=0;36:' ; export LS_COLORS

# Fix del key for st (suckless simple terminal)
tput smkx

# python rc
export PYTHONSTARTUP=~/.pythonstartup
# For use with breakpoint()
export PYTHONBREAKPOINT=ipdb.set_trace

#source ~/.profile
source ~/git-completion.bash
source ~/.shell_prompt.sh
# eval "$(pyenv init -)"
export PATH=/usr/local/sbin:/usr/sbin/:/sbin/:/usr/local/bin:/usr/bin:/Users/mrobinson/puppet-ng/administration-tools/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/sbin/:/sbin/:/Users/mrobinson/puppet-ng/administration-tools/bin:~/.proofpoint/rbenv/bin:$PATH
#eval "$(rbenv init -)"

statusall () {
    repos=$(find . -name .git 2> /dev/null)
    for repo in $repos
        do
            workingpath=$(dirname $repo)
            base=$(basename "${workingpath}")
            echo "${PWD}/${base}"
            git -C ${repo}/.. status -s
        done
}

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh"  ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion"  ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
