terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

// Defining cloud provider, profile and region
provider "aws" {
  // If you don't want to use default delete the line, then use next two lines calling access_key and secret_key
  // "default" uses the AWS credentials stored in your AWS Config File when you initially set up AWS CLI with "aws config"
  profile = "default"
  // Recommended to never hard-code credntials into *.tf configuration files
  // access_key = "123456"
  // secret_key = "123456"
  region  = "us-east-2"
}

// Creating an aws ec2 instance named "ntp_server"
// Specify desired ami and instance_type
resource "aws_instance" "ntp_server" {
  // CentOS 7 image for us-east-2 from https://wiki.centos.org/Cloud/AWS#head-78d1e3a4e6ba5c5a3847750d88266916ffe69648
  ami           = "ami-06cf02a98a61f9f5e"
  instance_type = "t2.micro"
}
