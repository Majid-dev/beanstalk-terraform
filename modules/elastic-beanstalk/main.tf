resource "aws_elastic_beanstalk_application" "my_app" {
  name        = "my-application"
  description = "My Elastic Beanstalk application"
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "my-environment"
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.8.2 running Node.js 18"
  cname_prefix        = "my-env"
  description         = "My Elastic Beanstalk environment"
  tier                = "WebServer"

  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = var.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = var.asg_private_subnet
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = var.elb_public_subnet
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "DBSubnets"
    value = var.db_private_subnet
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.asg_security_group
  }

setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.min_size
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }

#   setting {
#     namespace = "aws:autoscaling:asg"
#     name      = "Custom Availability Zones"
#     value     = var.availability_zone_names
#   }

  setting {
    namespace = "aws:elbv2:loadbalancer"
    name = "SecurityGroups"
    value = var.elb_security_group
  }


  setting {
    namespace = "aws:rds:dbinstance"
    name = "DBEngine"
    value = "mysql"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name = "DBEngineVersion"
    value = "8.0"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name = "DBInstanceClass"
    value = var.instance_class
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name = "DBUser"
    value = var.db_username
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name = "DBPassword"
    value = var.db_password
  }

  tags = {
    Environment = "Production"
  }
}
