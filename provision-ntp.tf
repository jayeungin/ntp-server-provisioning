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
  region  = "us-east-2"
}

// Creating an aws ec2 instance
// Specify desired ami and instance_type
resource "aws_instance" "ntp_server" {
  // CentOS 7 image needs to match region, see https://wiki.centos.org/Cloud/AWS
  ami           = "ami-0a75b786d9a7f8144"
  instance_type = "t2.micro"
  // Use AWS EC2 Key Pairs to create key pair, if you don't do this you won't be able to ssh/putty into your EC2
  key_name = "ntp-server"
}
