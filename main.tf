##Notes / TODO  :

# If this file is becoming unwieldy you can split into files like es.tf, dynamo.tf etc , 
# the variables.tf is already split accordingly

# There are only 2 flavors 
# 1. Each module creates a single resource typically eg. VPC , ES
# 2. Each module would create multiple resources (generally uses templates) eg. Kinesis , Dynamodb Tables

########################################################################################

#Local Vars
########################################################################################
locals {
  es_domain_name        = join("-" , ["es",var.namespace,var.env,var.business_domain,""] )
  kibana_subdomain_name = join("-" , ["kibana",var.namespace,var.env,var.business_domain,""] )
  dynamo_table_prefix   = join("-", [var.namespace, var.business_domain, ""])
  common_tags           = jsondecode(file("templates/stack_tags.json"))
}

#Dyanamo DB Table & Output
########################################################################################
module "dynamodb_table" {
  source       = "git::https://github.com/cloudfriends/tf-aws-dynamodb?ref=tags/1.0.0"
  aws_region   = var.aws_region
  table_prefix = local.dynamo_table_prefix
  table_def = jsondecode(templatefile("templates/dynamo_table_def.json.tpl", {
    dynamo_enable_replica = var.dynamo_enable_replica
  }))
  tags = merge(local.common_tags, { "extra" = "cookie" })
}

# module "dynamo_output_write2param_store" {
#   source = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store?ref=tags/0.4.0"
#   parameter_write = [{}]
#   tags = merge(local.common_tags, { "Resource" = "DynamoDb" , "CreatedBy" = "Terraform" })
# }

########################################################################################

#Elastic Search & Output
########################################################################################
module "elasticsearch" {
  source                         = "git::https://github.com/cloudfriends/tf-aws-elasticsearch?ref=tags/1.0.0"
  domain_name                    = local.es_domain_name
  elasticsearch_subdomain_name   = local.es_domain_name
  kibana_subdomain_name          = local.kibana_subdomain_name
  ebs_volume_size                = var.ebs_volume_size
  availability_zone_count        = var.availability_zone_count
  instance_type                  = var.instance_type
  instance_count                 = var.instance_count
  dedicated_master_count         = var.dedicated_master_count
  dedicated_master_type          = var.dedicated_master_type
  source_ips_api_access          = var.source_ips_api_access
  source_ips_all_access          = var.source_ips_all_access
  encrypt_at_rest_enabled        = var.encrypt_at_rest_enabled
  create_iam_service_linked_role = var.create_iam_service_linked_role
  tags                           = merge(local.common_tags, { "Resource" = "ES" })
}

module "es_output_write2param_store" {
  source = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store?ref=tags/0.4.0"
  parameter_write = [{
    name        = "/dev/esurl"
    value       = format("%s%s", "https://", module.elasticsearch.domain_endpoint)
    type        = "String"
    overwrite   = "true"
    description = "Elasticsearch URL"
  }]
  tags = merge(local.common_tags, { "Resource" = "Param" , "CreatedBy" = "Terraform" })
}
########################################################################################