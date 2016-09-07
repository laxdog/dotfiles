# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
home=/home/
# Makes mrxvt display UTF-8 better
#export LC_CTYPE=zh_CN.GB2312
export LC_CTYPE=en_GB.UTF-8

#set -o vi

umask 002

export EDITOR=vim
CVSROOT=:pserver:michaelrobinson@cvs.wombatfs.com:/cvsroot
export CVSROOT

PATH=/usr/sbin/:/sbin/:/usr/local/bin:/usr/bin:~/scripts:$PATH
export PATH

# Source the notes commands
#source ~/.notesrc

# Source random mrxvt background
#source ~/.randMrxvt
if [ "$TERM" == "screen" ]; then
    export TERM=screen-256color
fi
if [ "$TERM" == "st-256color" ]; then
    export TERM=screen-256color
fi
alias xt='export TERM=xterm'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
	PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]:\)\[\e[0m\]; else echo \[\e[31m\]:\(\[\e[0m\]; fi\` ${TITLEBAR}\[\e[0;32m\]\d \[\e[0;31m\]\t\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[1;37m\]\u\[\033[0m\]\[\033[0;33m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0m\]\[\033[0;33m\]:\[\033[0m\]\[\033[1;33m\]\w\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[0;32m\]\[\033[0m\]\[\033[1;37m\]\[\033[0m\]\[\033[1;37m\](\[\033[0m\]\[\033[0;33m\]\$(ls -l | grep \"^-\" | wc -l | tr -d \" \")\[\033[0m\]\[\033[1;37m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[0;37m\]files\[\033[0m\]\[\033[1;37m\], \[\033[0m\]\[\033[0;33m\]\$(ls --si -s | head -1 | awk '{print \$2}') \[\033[0m\]\[\033[0;37m\]total\[\033[0m\]\[\033[1;37m\])(\j)\n\[\033[0m\]\[\033[1;37m\]> \[\033[0;0m\]"
fi

#" Fix vim syntax highlight

if [ `uname -s` = "SunOS" ]; then
    export PATH=/opt/SUNWspro/bin:/usr/local/bin:/usr/ccs/bin:$PATH
    export MANPATH=/opt/SUNWspro/man:/usr/share/man:$MANPATH
    alias ls='ls'
	PS1="${TITLEBAR}\[\e[0;32m\]\d \[\e[0;31m\]\t\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[0;37m\]\u\[\033[0m\]\[\033[0;33m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0m\]\[\033[0;33m\]:\[\033[0m\]\[\033[1;33m\]\w\[\033\n\[\033[0m\]\[\033[1;37m\]> \[\033[0;0m\]"
	alias vi='/usr/bin/vi'
fi

# This will cause bash to fix a garbled terminal before the prompt is printed. For example, if you cat a file with nonprintable character sequences, the terminal sometimes ends up in a mode where it only prints line drawing characters. This sequence will return the terminal to the standard character set after every command.
export PS1="\[\017\033[m\033[?9l\033[?1000l\]$PS1"

export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

# extend history
export HISTSIZE=100000
export HISTFILESIZE=999999
export HISTCONTROL=ignoredups

alias clock="while true; do tput clear; date +\"%d%b %H:%M:%S\" | figlet ; sleep 1; done"

alias tsLaptop="rdesktop -umrobinson -dNYXEU -g1259x780 -rsound:off -rclipboard:PRIMARYCLIPBOARD -rdisk:poo=/tmp -b -5 10.224.193.142 &"
alias tsCambon="rdesktop -umrobinson -dNYXEU -g1597x1180 -rsound:off -rclipboard:PRIMARYCLIPBOARD -rdisk:poo=/tmp -b -5 10.224.193.142 &"
alias ts12801024="rdesktop -umrobinson -dNYXEU -g1277x1004 -rsound:off -rclipboard:PRIMARYCLIPBOARD -rdisk:poo=/tmp -b -5 10.224.193.142 &"
alias ts19201200="rdesktop -umrobinson -dNYXEU -g1917x1180 -rsound:off -rclipboard:PRIMARYCLIPBOARD -rdisk:poo=/tmp -b -5 10.224.193.142 &"
alias ports="sudo ssh -L 3128:10.0.2.1:3128 -L 993:10.0.2.1:993 -L 443:10.0.2.1:443 -D 12345 michaelr@wombat64"
alias cd4=`cd ../../../../`
alias rsym='rename .sym .sym.bak *.sym'
alias lynx='lynx -nocolor -accept_all_cookies -nopause'
alias psm='ps -ef | fgrep michaelr'
alias cdog='cd /var/userspace/dog'
alias ll='ls -latrh'
alias lss='ll'
alias sl='ll'
alias l='ll'
alias lst='ls --full-time -latr'
# List files recursively with newest modified first
alias lsMod='/home/michaelr/scripts/findLastMod.sh'
alias fixPS1='PS1="\[\017\033[m\033[?9l\033[?1000l\]\[\e[0;32m\]\d \[\e[0;31m\]\t\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[1;37m\]\u\[\033[0m\]\[\033[0;33m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0m\]\[\033[0;33m\]:\[\033[0m\]\[\033[1;33m\]\w\[\033[0m\]\[\033[0;33m\] \[\033[0m\]\[\033[0;32m\]\[\033[0m\]\[\033[1;37m\]\[\033[0m\]\[\033[1;37m\](\[\033[0m\]\[\033[0;33m\]X\[\033[0m\]\[\033[1;37m\] \[\033[0m\]\[\033[1;30m\]\[\033[0m\]\[\033[0;37m\]files\[\033[0m\]\[\033[1;37m\], \[\033[0m\]\[\033[0;33m\]X \[\033[0m\]\[\033[0;37m\]total\[\033[0m\]\[\033[1;37m\])(\j)\n\[\033[0m\]\[\033[1;37m\]> \[\033[0;0m\]"'
#Deletes the last entry in your history
alias histdel='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'
alias fact='wget randomfunfacts.com -O - 2>/dev/null|grep \<strong\>|sed "s;^.*<i>\(.*\)</i>.*$;\1;"'
#netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'
alias tcpCnx='netstat -an | grep ESTABLISHED | awk '\''{print $5}'\'' | awk -F: '\''{print $1}'\'' | sort | uniq -c | awk '\''{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'\'''
alias duplex='sudo ethtool -s eth0 speed 100 duplex full autoneg on'
#Checks if you have a tmux session and attaches or creates a new one
alias ltmux="if tmux has; then tmux attach; else tmux new; fi"
alias sshx='ssh -XC -o CompressionLevel=9 '
alias serveThis='python -m SimpleHTTPServer'
alias fgerp='fgrep'

#tmuxinator
source ~/.gem/ruby/gems/tmuxinator-0.7.1/completion/tmuxinator.bash

read_csv() {
    csvtool readable $1 | vim -
}
alias csvim=read_csv

DB2pdf()
{
    xmlFile=$1
    pdfFile=`echo $1 | sed s/"\.xml$"/"\.pdf"/`
    echo $xmlFile "->" $pdfFile
    fop -dpi 72 -xsl /home/xsl/custom/wombat-docbook-fo.xsl -xml $xmlFile -pdf $pdfFile
    #fop -dpi 72 -xsl /home/xsl/custom/wombat-docbook-fo.xsl -xml $xmlFile -pdf $pdfFile -Dhttp.proxyHost=10.119.6.99  -Dhttp.proxyPort=5865
}

if [ `hostname` = "neax-vmrh501" ]; then
	alias vi='/home/mrobinson/hackedVim/vim_py27_rhel5/bin/vim'
fi


#alias grep='grep --color=always'
#alias fgrep='fgrep --color=always'

# michaelr ssh alias'
alias can='su - wauto;ssh -p 22022 ftpsupport@canberra'
alias 01='ssh michaelr@wombat01'
alias 02='ssh michaelr@wombat02'
alias 03='ssh michaelr@wombat03'
alias 04='ssh michaelr@wombat04'
alias 05='ssh michaelr@wombat05'
alias 06='ssh michaelr@wombat06'
alias 07='ssh michaelr@wombat07'
alias 08='ssh michaelr@wombat08'
alias 09='ssh michaelr@wombat09'
alias 10='ssh michaelr@wombat10'
alias 11='ssh michaelr@wombat11'
alias 12='ssh michaelr@wombat12'
alias 13='echo "Windows box and pass"; ssh administrator@wombat13'
alias 14='ssh michaelr@wombat14'
alias 15='ssh michaelr@wombat15'
alias 16='ssh michaelr@wombat16'
alias 17='ssh michaelr@wombat17'
alias 21='ssh michaelr@wombat21'
alias 64='ssh michaelr@wombat64'
alias ex01='ssh michaelr@qa-ex01'
alias ex02='ssh michaelr@qa-ex02'
alias ex03='ssh michaelr@qa-ex03'
alias ex04='ssh michaelr@qa-ex04'
alias ex05='ssh michaelr@qa-ex05'
alias ex06='ssh michaelr@qa-ex06'
alias slert01='ssh michaelr@qa-slert01'
alias sydney='ssh michaelr@sydney'
alias p01='ssh michaelr@qa-perf01'
alias p02='ssh michaelr@qa-perf02'
alias p03='ssh michaelr@qa-perf03'
alias p04='ssh michaelr@qa-perf04'
alias p05='ssh michaelr@qa-perf05'
alias p06='ssh michaelr@qa-perf06'
# wauto ssh alias'
alias lob='ssh michaelr@rhel4-64.rocklobster.es.bfs.wombatfs.com'
alias vm='ssh michaelr@10.0.3.153'
alias ws01='ssh wauto@qa-slert01'
alias adelaide='ssh -p 46 michaelr@adelaide'
alias dys='ssh dog@belfast.no-ip.info'
alias cyn='ssh dog@groundzero.hopto.org'
alias mercure='ssh wepwms@138.190.0.34'
alias box='ssh -x michaelr@michaelr'
alias wrh432='ssh wepbuild@rhel4-32.rocklobster.es.bfs.wombatfs.com'
alias wrh464='ssh wepbuild@michaelr'
#alias wrh564='ssh wepbuild@rhel5-64.rocklobster.es.bfs.wombatfs.com'
alias wrh564='ssh wepbuild@10.119.20.75'
alias liffe21='ssh connect@10.230.200.11'
alias liffe18='ssh connect@10.230.200.34'

#for i in {1..23}; do
#    num=`printf "%02d" $i`
#        echo alias perf$num=\'ssh axtsperf${num}\'
#    done

alias perfa='ssh root@axtsperfadmin'
alias perf01='ssh axtsperf01'
alias perf01='ssh axtsperf01'
alias perf02='ssh axtsperf02'
alias perf03='ssh axtsperf03'
alias perf04='ssh axtsperf04'
alias perf05='ssh axtsperf05'
alias perf06='ssh axtsperf06'
alias perf07='ssh axtsperf07'
alias perf08='ssh axtsperf08'
alias perf09='ssh axtsperf09'
alias perf10='ssh axtsperf10'
alias perf11='ssh axtsperf11'
alias perf12='ssh axtsperf12'
alias perf13='ssh axtsperf13'
alias perf14='ssh axtsperf14'
alias perf15='ssh axtsperf15'
alias perf16='ssh axtsperf16'
alias perf17='ssh axtsperf17'
alias perf18='ssh axtsperf18'
alias perf19='ssh axtsperf19'
alias perf20='ssh axtsperf20'
alias perf21='ssh axtsperf21'
alias perf22='ssh axtsperf22'
alias perf23='ssh axtsperf23'

ulimit -c unlimited

xhost + >/dev/null 2>&1
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

export WORKON_HOME=~/virtual_envs/

export P4PORT=10.230.227.41:1666
export P4USER=mrobinson
export P4EDITOR=vim
export P4DIFF=vimdiff
export P4CLIENT=`id -un`-`hostname`

# Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#dir colours for ls
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'*.py=0;36:' ; export LS_COLORS

# Fix del key for st (suckless simple terminal)
tput smkx

# Update pkg config search location
export PKG_CONFIG_PATH=`pkg-config --variable pc_path pkg-config`
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/share/pkgconfig/
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib64/pkgconfig/

function th {
    tmux split-window -dh "$*"
}

function tv {
    tmux split-window -dv "$*"
}
