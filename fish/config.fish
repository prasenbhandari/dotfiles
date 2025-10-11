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

# # pyenv configuration for Fish shell
# set -gx PYENV_ROOT "$HOME/.pyenv"
# set -gx PATH "$PYENV_ROOT/bin" $PATH
# status --is-interactive; and pyenv init - | source


