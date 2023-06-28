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

#launch template variables
variable "instance_type" {}
variable "user_data_file" {}

#target group variables
variable "health_check_path" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "tg_target_type" {}

#auto scaling group variables
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
