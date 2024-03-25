#!/bin/bash

# DESCRIPTION -  Add/remove port 22/ssh
# Quick and dirty manipulation of Firewalld and Systemd


# Login with elevated privileges 
if [ "$EUID" -ne 0 ]
then
    exec sudo -s "$0" "$@"
fi

# Check which services are running
firewall-cmd --zone=public --list-all  && firewall-cmd --zone=internal --list-all

# Choose to block or unblock ssh
echo ""
read -p "Enter < 0 > to remove ssh or < 1 > to enable ssh " boolean_variable
 
# Remove ssh service
if [ "$boolean_variable" -eq 0 ] ; then   
    firewall-cmd --zone=internal --remove-service=ssh --permanent  && firewall-cmd --zone=public --remove-service=ssh --permanent 
    systemctl stop sshd
    systemctl disable sshd
    echo "SSH is removed"


# Add ssh service
elif [ "$boolean_variable" -eq 1 ] ; then   
    firewall-cmd --zone=internal --add-service=ssh --permanent  && firewall-cmd --zone=public --add-service=ssh --permanent 
    systemctl start sshd
    systemctl enable sshd
    echo "SSH is added"
else
    echo "Nothing changed?"
fi

firewall-cmd --reload

sudo -k
