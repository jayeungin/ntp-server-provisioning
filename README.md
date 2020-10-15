# ntp-server-provisioning
Using Terraform and Saltstack to provision a NTP server automatically.

Prerequisites:
1. Install AWS CLI on local machine
  a. See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html for additional help setting this up
2. Install Terraform on local machine

Using Terraform to provision the NTP Server:
1. Navigate to project directory with configuration files (.tf)
2. terraform init - initializes the directory (think git init)
3. terraform plan - shows the execution plan, describing which actions Terraform will take in order to change real infrastructure to match the config
4. terraform apply - applies the terraform plan

Install Saltstack on the NTP Server:
1. In the AWS Console, ssh into the server.
2. Run the following commands -
