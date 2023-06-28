variable "aws_access_key" {}
variable "aws_secret_key" {}

# environment variables
variable "region" {}
variable "project_name" {}
variable "environment" {}

#vpc variables
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

#beanstalk variables
variable "instance_type" {}
variable "min_size" {}
variable "max_size" {}
variable "instance_class" {}
variable "db_username" {}
variable "db_password" {}

