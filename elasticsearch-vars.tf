variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "ES Domain Name "
}

variable "vpc_enabled" {
  type        = bool
  description = "Set to false if ES should be deployed outside of VPC."
  default     = false
}

variable "instance_type" {
  type        = string
  default     = "t2.small.elasticsearch"
  description = "Elasticsearch instance type for data nodes in the cluster"
}

variable "instance_count" {
  type        = number
  description = "Number of data nodes in the cluster"
  default     = 4
}

variable "availability_zone_count" {
  type        = number
  default     = 2
  description = "Number of Availability Zones for the domain to use."
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volumes for data storage in GB"
  default     = 0
}

variable "encrypt_at_rest_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable encryption at rest"
}

variable "encrypt_at_rest_kms_key_id" {
  type        = string
  default     = ""
  description = "The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key"
}

variable "node_to_node_encryption_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable node-to-node encryption"
}

variable "dedicated_master_enabled" {
  type        = bool
  default     = true
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_count" {
  type        = number
  description = "Number of dedicated master nodes in the cluster"
  default     = 0
}

variable "dedicated_master_type" {
  type        = string
  default     = "t2.small.elasticsearch"
  description = "Instance type of the dedicated master nodes in the cluster"
}

variable "create_iam_service_linked_role" {
  type        = bool
  default     = true
  description = "Whether to create `AWSServiceRoleForAmazonElasticsearchService` service-linked role. Set it to `false` if you already have an ElasticSearch cluster created in the AWS account and AWSServiceRoleForAmazonElasticsearchService already exists. See https://github.com/terraform-providers/terraform-provider-aws/issues/5218 for more info"
}

variable "aws_ec2_service_name" {
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
  description = "AWS EC2 Service Name"
}

variable source_ips_all_access {
  type        = list
  default     = []
  description = "IP's which will have full access"
}

variable source_ips_api_access {
  type        = list
  default     = []
  description = "IP's which will have limited access"
}

variable advanced_options {
  type        = map
  description = "Key-value string pairs to specify advanced configuration options"
  default = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}
