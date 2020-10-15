# ntp-server-provisioning
Using Terraform and Saltstack to provision a NTP server automatically.

## Prerequisites:
1. Install AWS CLI on local machine
  a. See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html for additional help setting this up
2. Install Terraform on local machine

## Using Terraform to provision the NTP Server:
1. Navigate to project directory with configuration files (.tf)
2. terraform init - initializes the directory (think git init)
3. terraform plan - shows the execution plan, describing which actions Terraform will take in order to change real infrastructure to match the config
4. terraform apply - applies the terraform plan (includes install salt-master/minion)

## Install Saltstack on the NTP Server and tell Salt to run masterless:
1. SSH/PuTTY into the server.
2. Modify line 579 of configuration file '/etc/salt/minion' to match - 'file_client: local'

## Create State Tree:
1. Create the '/srv/salt/top.sls' file - copy from 'Saltstack/top.sls'
2. Create the '/srv/salt/ntpserver.sls' state tree- copy from 'Saltstack/ntpserver.sls'
