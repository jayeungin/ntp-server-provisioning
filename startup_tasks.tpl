#!/usr/bin/env bash

sudo su
yum -y update
# Bootstrapping a masterless salt-minion
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sh bootstrap_salt.sh
# Installing VIM
yum -y install vim
# Installing git
yum -y install git
git clone https://github.com/jayeungin/ntp-server-provisioning.git
# Copying Salt files
cd net-server-provisioning/saltstack
salt-call --local state.apply -l debug
