#Domenico Costanzo - 2020
#Personal Aliases for Linux

#############################
#       Basic Aliases       #
#############################
# Clear the Screen
alias cls='clear'

# Output previous command history
alias h='history'

# Output currently active jobs with PIDs
alias j="jobs -l"

# Refresh ~/.bashrc 
# This will load any newly added aliases
alias refresha="source ~/.bashrc"

##################################

#############################
#         Add-Alias         #
#############################
# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

#############################
#         Clean             #
#############################
#Clean a directory
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'

#############################
#      Repeat Command       #
#############################
# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
_seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}
##################################
