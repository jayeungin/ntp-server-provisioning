#!/bin/bash
sudo su

# Disabling Chrony
systemctl stop chronyd
systemctl disable chronyd

# Installing ntpd
yum install -y ntpd

# Configuring ntpd and checking the firewall
firewall-cmd --zone=public --add-port=123/udp --permanent
timedatectl set-timezone America/New_York

# Activating ntpd
systemctl start ntpd
systemctl enable ntpd
