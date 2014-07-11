
# Display Waratek license file
if [ -t 0 ] && [ $UID -ne 0 ]
then
    /usr/local/bin/display_license.sh
fi
