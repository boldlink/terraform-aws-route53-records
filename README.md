[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-route53-records/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-route53-records.svg)](https://github.com/boldlink/terraform-aws-route53-records/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53-records/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53-records/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS Route53 Record Terraform module
This Terraform module creates a Route53 record in AWS. It provides a flexible way to configure various types of routing policies for your DNS records.

## Reasons to Use this Module
- Creates a Route53 record with the specified zone ID, name, type, TTL, and records.
- Supports optional attributes
- Supports different routing policies including geolocation, failover, latency, weighted, and CIDR-based routing.
- Provides the option for alias records that can point to AWS resources using their AWS resource name.
- Allows only one routing policy block to be supplied.
- Adheres to security best practices by leveraging automated scanning with Checkov.

Examples available [`here`](./examples)

## Usage
**NOTE:** These examples use the latest version of this module

```hcl
module "miniumum" {
  source  = "boldlink/<module_name>/<provider>"
  version = "x.x.x"
  <insert the minimum required variables here if any are required>
  ...
}
```
## Documentation

[Amazon Route 53 Documentation](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | (Optional) An alias block. Conflicts with ttl & records. | `any` | `{}` | no |
| <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite) | Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. `false` by default. This configuration is not recommended for most environments. | `bool` | `false` | no |
| <a name="input_cidr_routing_policy"></a> [cidr\_routing\_policy](#input\_cidr\_routing\_policy) | (Optional) A block indicating a routing policy based on the IP network ranges of requestors. Conflicts with any other routing policy. | `map(string)` | `{}` | no |
| <a name="input_failover_routing_policy"></a> [failover\_routing\_policy](#input\_failover\_routing\_policy) | (Optional) A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy. | `any` | `{}` | no |
| <a name="input_geolocation_routing_policy"></a> [geolocation\_routing\_policy](#input\_geolocation\_routing\_policy) | (Optional) A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy. | `any` | `{}` | no |
| <a name="input_health_check_id"></a> [health\_check\_id](#input\_health\_check\_id) | (Optional) The health check the record should be associated with. | `string` | `null` | no |
| <a name="input_latency_routing_policy"></a> [latency\_routing\_policy](#input\_latency\_routing\_policy) | (Optional) A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy. | `any` | `{}` | no |
| <a name="input_multivalue_answer_routing_policy"></a> [multivalue\_answer\_routing\_policy](#input\_multivalue\_answer\_routing\_policy) | (Optional) Set to `true` to indicate a multivalue answer routing policy. Conflicts with any other routing policy. | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the record. | `string` | `null` | no |
| <a name="input_records"></a> [records](#input\_records) | (Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add "" inside the Terraform configuration string (e.g., "first255characters`""`morecharacters"). | `list(string)` | `[]` | no |
| <a name="input_set_identifier"></a> [set\_identifier](#input\_set\_identifier) | (Optional) Unique identifier to differentiate records with routing policies from one another. Required if using `cidr_routing_policy`, `failover_routing_policy`, `geolocation_routing_policy`, `latency_routing_policy`, `multivalue_answer_routing_policy`, or `weighted_routing_policy`. | `string` | `null` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Required for non-alias records) The TTL of the record. | `number` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) The record type. Valid values are `A`, `AAAA`, `CAA`, `CNAME`, `DS`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV` and `TXT` | `string` | `null` | no |
| <a name="input_weighted_routing_policy"></a> [weighted\_routing\_policy](#input\_weighted\_routing\_policy) | (Optional) A block indicating a weighted routing policy. Conflicts with any other routing policy. | `any` | `{}` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | (Required) The ID of the hosted zone to contain this record. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN built using the zone domain and name. |
| <a name="output_name"></a> [name](#output\_name) | The name of the record. |
| <a name="output_ttl"></a> [ttl](#output\_ttl) | The TTL of the record. |
| <a name="output_type"></a> [type](#output\_type) | The record type. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ID of the hosted zone to contain this record. |
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

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contain in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```

#### BOLDLink-SIG 2023
