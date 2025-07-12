function man
    command man $argv | bat -pl man
end

if test -z "$SSH_AUTH_SOCK"
  eval (ssh-agent -c)  # -c starts the agent and sets the variables
end

if status is-interactive
    # Commands to run in interactive sessions can go here
	set fish_greeting
	fastfetch
end

alias ls 'ls --color=auto'
alias grep 'grep --color=auto'
alias speedtest 'speedtest --secure'


# Created by `pipx` on 2024-11-29 05:29:10
set PATH $PATH /home/prasen/.local/bin
set path $PATH /home/prasen/.local/share/gem/ruby/3.3.0/bin

set -Ux HADOOP_HOME ~/hadoop
set -Ux JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -x PATH $PATH $HADOOP_HOME/bin $HADOOP_HOME/sbin
