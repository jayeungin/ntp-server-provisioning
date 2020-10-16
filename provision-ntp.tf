terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

# Defining cloud provider, profile and region
provider "aws" {

  # "default" uses the AWS credentials stored in your AWS Config File through AWS CLI via "aws config"; If you don't want to use default delete the line, then add two lines calling access_key and secret_key
  profile = "default"
  region  = "us-east-2"
}

# Creating an aws ec2 instance
# Specify desired ami and instance_type
resource "aws_instance" "master_ntp_server" {

  # CentOS 7 image needs to match region, see https://wiki.centos.org/Cloud/AWS
  ami = "ami-0a75b786d9a7f8144"
  instance_type = "t2.micro"

  # Use AWS EC2 Key Pairs to create key pair, if you don't do this you won't be able to ssh/putty into your EC2
  key_name = "ntp-server"

  # Pass in scripts to be executed in the first boot of the instance
  # Installs salt on EC2
  user_data = <<-EOF
                  #!/bin/bash
                  yum update -y
                  sudo su
                  yum -y install salt-master
                  # Installing VIM
                  yum -y install vim
                  # Installing git
                  yum -y install git
                  git clone https://github.com/jayeungin/ntp-server-provisioning.git
                  # Navigate to Salt files
                  cd net-server-provisioning/saltstack
                  # Applying Salt state
                  salt-call --local state.apply -l debug
                  EOF
}
