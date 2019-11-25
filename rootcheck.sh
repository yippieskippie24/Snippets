#!/bin/bash

# ROOT CHECK ##
# Are we root? If not use sudo
# Need to have the $SUDO appended before all commands to ensure sudo can be added if needed.
if [[ $EUID -eq 0 ]];then
    SUDO=""
else
    echo "Sudo will appended to the command."
    # Check if it is actually installed
    # If it isn't, exit because the install cannot complete
    if [[ $(dpkg-query -s sudo) ]];then
        export SUDO="sudo"
    else
        exiterror=$(echo "Please install sudo or run script as root.")
        EXIT
    fi
fi
