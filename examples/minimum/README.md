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

# Terraform module example of minimum configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.12.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minimum_example"></a> [minimum\_example](#module\_minimum\_example) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the record | `string` | `"minimum"` | no |
| <a name="input_records"></a> [records](#input\_records) | Records for the record | `list(string)` | <pre>[<br>  "10.0.0.0"<br>]</pre> | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | Time to live for the record | `number` | `60` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the record | `string` | `"A"` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the hosted zone | `string` | `"boldlink-r53-records-example.com"` | no |

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
