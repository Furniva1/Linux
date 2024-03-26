#!/bin/bash

# Description: Create a message-of-the-day MOTD file for a SSH terminal entry
# into the system. Review file after its been created, rename without the big D.
# "Harder than it looks?!!"

# Login with elevated privileges 
if [ "$EUID" -ne 0 ]
then
    exec sudo -s "$0" "$@"
fi


# motdD should not overwrite anything upon creation
touch ~/motdD

echo "##########################################################" >> ~/motdD
echo "##########################################################" >> ~/motdD
echo "                                                          " >> ~/motdD     
echo "WARNING: UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED." >> ~/motdD
echo "By accessing this system, you agree that your actions will" >> ~/motdD
echo "be monitored and logged!                                  " >> ~/motdD
echo "                                                          " >> ~/motdD       
echo "##########################################################" >> ~/motdD
echo "##########################################################" >> ~/motdD


# This bit needs elevated privileges
mv ~/motdD /etc/motdD

echo "MOTD has completed successfully! MOTD can be found here /etc/motd"

# remove sudo elevation
sudo -k
