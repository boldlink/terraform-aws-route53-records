data "aws_region" "current" {}
data "aws_route53_zone" "selected" {
  name = var.supporting_name
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.supporting_name]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["${var.supporting_name}.public.*"]
  }
}

data "aws_security_groups" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
