sudo su
yum -y update
# Bootstrap a masterless salt-minion
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sh bootstrap_salt.sh
yum install vim
yum install git
cd ..
git clone https://github.com/jayeungin/ntp-server-provisioning.git
