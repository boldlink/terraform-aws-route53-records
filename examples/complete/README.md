[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-route53-records/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-route53-records.svg)](https://github.com/boldlink/terraform-aws-route53-records/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform  module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_example_record"></a> [complete\_example\_record](#module\_complete\_example\_record) | ../../ | n/a |
| <a name="module_complete_example_record_elb"></a> [complete\_example\_record\_elb](#module\_complete\_example\_record\_elb) | boldlink/elb/aws | 1.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_cidr_collection.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_collection) | resource |
| [aws_route53_health_check.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_health_check) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_security_groups.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_groups) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_name"></a> [a\_record\_name](#input\_a\_record\_name) | The name of the record. | `string` | `"a-record"` | no |
| <a name="input_a_record_records"></a> [a\_record\_records](#input\_a\_record\_records) | A string list of records. | `list(string)` | <pre>[<br>  "10.200.30.20"<br>]</pre> | no |
| <a name="input_a_record_ttl"></a> [a\_record\_ttl](#input\_a\_record\_ttl) | The TTL of the record. | `number` | `300` | no |
| <a name="input_alias_name"></a> [alias\_name](#input\_alias\_name) | The name of the alias record. | `string` | `"alias-record"` | no |
| <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite) | Allow creation of this record in Terraform to overwrite an existing record | `bool` | `true` | no |
| <a name="input_c_record_name"></a> [c\_record\_name](#input\_c\_record\_name) | The name of the record. | `string` | `"www"` | no |
| <a name="input_c_record_records"></a> [c\_record\_records](#input\_c\_record\_records) | A string list of records. | `list(string)` | <pre>[<br>  "live.example.com"<br>]</pre> | no |
| <a name="input_c_record_set_identifier"></a> [c\_record\_set\_identifier](#input\_c\_record\_set\_identifier) | Unique identifier to differentiate records with routing policies from one another. | `string` | `"live"` | no |
| <a name="input_c_record_ttl"></a> [c\_record\_ttl](#input\_c\_record\_ttl) | The TTL of the record. | `number` | `10` | no |
| <a name="input_c_record_weight"></a> [c\_record\_weight](#input\_c\_record\_weight) | A numeric value indicating the relative weight of the record. | `number` | `90` | no |
| <a name="input_country"></a> [country](#input\_country) | Country for geo record policy | `string` | `"US"` | no |
| <a name="input_evaluate_target_health"></a> [evaluate\_target\_health](#input\_evaluate\_target\_health) | Whether you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set | `bool` | `true` | no |
| <a name="input_general_record_type"></a> [general\_record\_type](#input\_general\_record\_type) | Record type to be used for a number of records | `string` | `"A"` | no |
| <a name="input_geo_record_name"></a> [geo\_record\_name](#input\_geo\_record\_name) | Name of geo record | `string` | `"geo"` | no |
| <a name="input_geo_record_ttl"></a> [geo\_record\_ttl](#input\_geo\_record\_ttl) | TTL of geo record | `number` | `120` | no |
| <a name="input_geo_records"></a> [geo\_records](#input\_geo\_records) | List of records | `list(string)` | <pre>[<br>  "10.0.0.1",<br>  "10.0.0.2"<br>]</pre> | no |
| <a name="input_geo_set_identifier"></a> [geo\_set\_identifier](#input\_geo\_set\_identifier) | Unique Identifier of the record | `string` | `"us-ca"` | no |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The instance traffice port | `number` | `5000` | no |
| <a name="input_instance_protocol"></a> [instance\_protocol](#input\_instance\_protocol) | Traffic protocol to instance | `string` | `"http"` | no |
| <a name="input_lb_port"></a> [lb\_port](#input\_lb\_port) | The load balancer port | `number` | `80` | no |
| <a name="input_lb_protocol"></a> [lb\_protocol](#input\_lb\_protocol) | The load balancer traffic protocol | `string` | `"http"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the stack | `string` | `"complete-example-r53-record"` | no |
| <a name="input_subdivision"></a> [subdivision](#input\_subdivision) | Subdivision for geo record policy | `string` | `"CA"` | no |
| <a name="input_supporting_name"></a> [supporting\_name](#input\_supporting\_name) | The name of the vpc for load balancer | `string` | `"boldlink-r53-records-example.com"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2023
