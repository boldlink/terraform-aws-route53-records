locals {
  zone_id = data.aws_route53_zone.selected.zone_id
  records = {
    A = {
      zone_id = local.zone_id
      name    = var.a_record_name
      type    = var.general_record_type
      ttl     = var.a_record_ttl
      records = var.a_record_records
    }

    CNAME = {
      zone_id        = local.zone_id
      name           = var.c_record_name
      type           = "CNAME"
      ttl            = var.c_record_ttl
      set_identifier = var.c_record_set_identifier
      records        = var.c_record_records

      weighted_routing_policy = {
        weight = var.c_record_weight
      }
    }

    Alias = {
      zone_id = local.zone_id
      name    = var.alias_name
      type    = var.general_record_type

      alias = {
        name                   = module.complete_example_record_elb.dns_name
        zone_id                = module.complete_example_record_elb.zone_id
        evaluate_target_health = var.evaluate_target_health
      }
    }

    Geo = {
      zone_id         = local.zone_id
      name            = var.geo_record_name
      type            = var.general_record_type
      ttl             = var.geo_record_ttl
      records         = var.geo_records
      allow_overwrite = var.allow_overwrite
      set_identifier  = var.geo_set_identifier

      geolocation_routing_policy = {
        country     = var.country
        subdivision = var.subdivision
      }
    }
    failover = {
      zone_id         = local.zone_id
      name            = "failover"
      type            = var.general_record_type
      ttl             = "60"
      allow_overwrite = var.allow_overwrite
      set_identifier  = "primary-failover"

      alias = {
        name                   = module.complete_example_record_elb.dns_name
        zone_id                = module.complete_example_record_elb.zone_id
        evaluate_target_health = var.evaluate_target_health
      }

      failover_routing_policy = {
        type = "PRIMARY"
      }
    }
    latency = {
      zone_id         = local.zone_id
      name            = "latency"
      type            = var.general_record_type
      ttl             = "60"
      allow_overwrite = var.allow_overwrite
      set_identifier  = "latency"

      alias = {
        name                   = module.complete_example_record_elb.dns_name
        zone_id                = module.complete_example_record_elb.zone_id
        evaluate_target_health = var.evaluate_target_health
      }

      latency_routing_policy = {
        region = data.aws_region.current.name
      }
    }
    ip-based = {
      zone_id         = local.zone_id
      name            = "ip-based"
      type            = var.general_record_type
      ttl             = "60"
      allow_overwrite = var.allow_overwrite
      set_identifier  = "ip-based"

      alias = {
        name                   = module.complete_example_record_elb.dns_name
        zone_id                = module.complete_example_record_elb.zone_id
        evaluate_target_health = var.evaluate_target_health
      }

      cidr_routing_policy = {
        collection_id = aws_route53_cidr_collection.example.id
        location_name = "*"
      }
    }
  }
}
