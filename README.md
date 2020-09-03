## How to Use this repo

terraform init  -var-file="params/local/variables.tfvars

terraform plan  -var-file="params/local/variables.tfvars

To visualize the plan 
terraform plan -out=plan.out && terraform show -json plan.out > plan.json
https://hieven.github.io/terraform-visual/plan-details

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.32 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| advanced\_options | Key-value string pairs to specify advanced configuration options | `map` | <pre>{<br>  "rest.action.multi.allow_explicit_index": "true"<br>}</pre> | no |
| availability\_zone\_count | Number of Availability Zones for the domain to use. | `number` | `2` | no |
| aws\_ec2\_service\_name | AWS EC2 Service Name | `list(string)` | <pre>[<br>  "ec2.amazonaws.com"<br>]</pre> | no |
| aws\_region | AWS Region | `string` | `"us-east-1"` | no |
| business\_domain | Business Domain , e.g. 'inventory', 'parts' | `string` | `""` | no |
| create\_iam\_service\_linked\_role | Whether to create `AWSServiceRoleForAmazonElasticsearchService` service-linked role. Set it to `false` if you already have an ElasticSearch cluster created in the AWS account and AWSServiceRoleForAmazonElasticsearchService already exists. See https://github.com/terraform-providers/terraform-provider-aws/issues/5218 for more info | `bool` | `true` | no |
| dedicated\_master\_count | Number of dedicated master nodes in the cluster | `number` | `0` | no |
| dedicated\_master\_enabled | Indicates whether dedicated master nodes are enabled for the cluster | `bool` | `true` | no |
| dedicated\_master\_type | Instance type of the dedicated master nodes in the cluster | `string` | `"t2.small.elasticsearch"` | no |
| domain\_name | ES Domain Name | `string` | `""` | no |
| dynamo\_enable\_replica | Enable /Disable DynamoDB Replica Tables | `bool` | `true` | no |
| dynamo\_replica\_region | Region for DynamoDB Replica Tables | `string` | `""` | no |
| ebs\_volume\_size | EBS volumes for data storage in GB | `number` | `0` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| encrypt\_at\_rest\_enabled | Whether to enable encryption at rest | `bool` | `true` | no |
| encrypt\_at\_rest\_kms\_key\_id | The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key | `string` | `""` | no |
| env | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| instance\_count | Number of data nodes in the cluster | `number` | `4` | no |
| instance\_type | Elasticsearch instance type for data nodes in the cluster | `string` | `"t2.small.elasticsearch"` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'rti' or 'ddoa' | `string` | `""` | no |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | `bool` | `true` | no |
| source\_ips\_all\_access | IP's which will have full access | `list` | `[]` | no |
| source\_ips\_api\_access | IP's which will have limited access | `list` | `[]` | no |
| table\_def | DynamoDB Table Definition | `any` | `{}` | no |
| tags | Common tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| vpc\_enabled | Set to false if ES should be deployed outside of VPC. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_arn | n/a |
| es\_domain\_endpoint | n/a |
| es\_domain\_id | n/a |
| es\_domain\_name | n/a |
| kibana\_endpoint | n/a |
| table-arns | DynamoDB table arn |
| table-info-list | DynamoDB table mapping |
| table-names | DynamoDB table name |

