module "complete_example_record_elb" {
  source             = "boldlink/elb/aws"
  version            = "1.1.0"
  name               = var.elb_name
  subnets            = flatten(data.aws_subnets.public.ids)
  security_groups    = flatten(data.aws_security_groups.main.ids)
  availability_zones = data.aws_availability_zones.available.names

  # Listeners
  listeners = [
    {
      instance_port     = var.instance_port
      instance_protocol = var.instance_protocol
      lb_port           = var.lb_port
      lb_protocol       = var.lb_protocol
    }
  ]
}

# Create Multiple records
module "complete_example_record" {
  source                     = "../../"
  for_each                   = local.records
  zone_id                    = each.value.zone_id
  name                       = each.value.name
  type                       = each.value.type
  ttl                        = try(each.value.ttl, null)
  set_identifier             = try(each.value.set_identifier, null)
  records                    = try(each.value.records, [])
  allow_overwrite            = try(each.value.allow_overwrite, null)
  weighted_routing_policy    = lookup(each.value, "weighted_routing_policy", {})
  alias                      = lookup(each.value, "alias", {})
  geolocation_routing_policy = lookup(each.value, "geolocation_routing_policy", {})
  depends_on                 = [module.complete_example_record_elb]
}
