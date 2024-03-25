#!/bin/bash
# Credit lost YouTube video - the only macchanger method that actually worked
# Description: Script employ's macchanger on startup
# - macchanger changes the wifi MAC address after every reboot/startup
# - systemd service location /etc/systemd/system/my-startup.service
# - service triggers on multi-user.target


# Part 1) my-startup.service script below:

# [Unit] 
# Description=My Startup
#
# [Service]
# ExecStart=/usr/local/sbin/my-startup.sh
#
# [Install]
# WantedBy=multi-user.target


# Part 2) The service must be started after placement
# systemctl start my-startup.service
# systemctl enable my-startup.service
# systemctl status my-startup.service


# Part 3) my-startup.sh macchanger script below:
macchanger -r wlp0s20f3
