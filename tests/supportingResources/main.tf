module "route53_records_zone" {
  source = "boldlink/route53/aws"
  name   = var.name
  tags   = var.tags
}

module "route53_records_elb_vpc" {
  source                  = "boldlink/vpc/aws"
  version                 = "3.0.4"
  name                    = var.name
  cidr_block              = var.cidr_block
  enable_dns_support      = var.enable_dns_support
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_public_subnets   = var.enable_public_subnets
  enable_internal_subnets = var.enable_internal_subnets
  tags                    = var.tags

  public_subnets = {
    public = {
      cidrs                   = local.public_subnets
      map_public_ip_on_launch = var.map_public_ip_on_launch
      nat                     = var.nat
    }
  }
}
