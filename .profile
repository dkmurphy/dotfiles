# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# from https://unix.stackexchange.com/questions/9605/how-can-i-detect-if-the-shell-is-controlled-from-ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

if [ "$SESSION_TYPE" != "remote/ssh" ]; then
  ## make CapsLock behave like Ctrl:
  #setxkbmap -option ctrl:nocaps
  ## make short-pressed Ctrl behave like Escape if xcape installed:
  #command -v xcape >/dev/null 2>&1 && xcape -e 'Control_L=Escape'
  ###
  # make CapsLock behave like Ctrl:
  setxkbmap -option 'caps:ctrl_modifier'
  # make short-pressed Ctrl behave like Escape if xcape installed:
  command -v xcape >/dev/null 2>&1 && xcape -e 'Caps_Lock=Escape'
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
