## make CapsLock behave like Ctrl:
#setxkbmap -option ctrl:nocaps
## make short-pressed Ctrl behave like Escape if xcape installed:
#command -v xcape >/dev/null 2>&1 && xcape -e 'Control_L=Escape'

# make CapsLock behave like Ctrl:
setxkbmap -option 'caps:ctrl_modifier'
# make short-pressed Ctrl behave like Escape if xcape installed:
command -v xcape >/dev/null 2>&1 && xcape -e 'Caps_Lock=Escape'

# History configuration
# # don't put duplicate lines or lines starting with space in the history. 
# # See bash(1) for more options 
# HISTCONTROL=ignoreboth 
# append to the history file, don't overwrite it 
shopt -s histappend 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) 
HISTSIZE=-1 
HISTFILESIZE=-1 
# Save and reload the history after each command finishes 
# (share history among different terminals) 
 
# precmd_function needed due to Skippy breaking it 
# so instead of 
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" 
# have to do 
function prompt_command_precmd_function() { history -a; history -c; history -r; } 
precmd_functions+=(prompt_command_precmd_function)
