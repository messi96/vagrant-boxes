# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Display Waratek license file
if [ -t 0 ]
then
    /usr/local/bin/display_license.sh
fi
