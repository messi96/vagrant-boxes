# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -r /u01/app/oracle/product/*/xe/bin/oracle_env.sh ]
then
    . /u01/app/oracle/product/*/xe/bin/oracle_env.sh
fi

PATH=$PATH:$HOME/bin

export PATH

# Display Waratek license file
if [ -t 0 ]
then
    /usr/local/bin/display_license.sh
fi
