module "complete_example_record_elb" {
  source             = "boldlink/elb/aws"
  version            = "1.1.0"
  name               = "${var.name}-elb"
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

resource "aws_route53_cidr_collection" "example" {
  name = "${var.name}-collection"
}

resource "aws_route53_health_check" "example" {
  fqdn              = var.supporting_name
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "2"
  request_interval  = "30"
}

# Create Multiple records
module "complete_example_record" {
  source                     = "../../"
  for_each                   = local.records
  zone_id                    = try(each.value.zone_id, null)
  name                       = each.value.name
  type                       = each.value.type
  ttl                        = try(each.value.ttl, null)
  set_identifier             = try(each.value.set_identifier, null)
  health_check_id            = try(each.value.health_check_id, null)
  records                    = try(each.value.records, [])
  allow_overwrite            = try(each.value.allow_overwrite, null)
  weighted_routing_policy    = lookup(each.value, "weighted_routing_policy", {})
  alias                      = lookup(each.value, "alias", {})
  geolocation_routing_policy = lookup(each.value, "geolocation_routing_policy", {})
  failover_routing_policy    = lookup(each.value, "failover_routing_policy", {})
  latency_routing_policy     = lookup(each.value, "latency_routing_policy", {})
  cidr_routing_policy        = lookup(each.value, "cidr_routing_policy", {})
  depends_on                 = [module.complete_example_record_elb]
}
