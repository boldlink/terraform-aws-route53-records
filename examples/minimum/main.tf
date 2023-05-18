module "minimum_example" {
  source  = "../../"
  zone_id = local.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = var.records
}
