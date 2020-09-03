##Elastic Search##

output "es_arn" {
  value = module.elasticsearch.domain_arn
}

output "es_domain_name" {
  value = module.elasticsearch.domain_name
}

output "es_domain_id" {
  value = module.elasticsearch.domain_id
}

output "es_domain_endpoint" {
  value = format("%s%s", "https://", module.elasticsearch.domain_endpoint)
}

output "kibana_endpoint" {
  value = format("%s%s", "https://", module.elasticsearch.kibana_endpoint)
}

##DynamoDB##

output "table-names" {
  value       = module.dynamodb_table.table-names
  description = "DynamoDB table name"
}

output "table-arns" {
  value       = module.dynamodb_table.table-arns
  description = "DynamoDB table arn"
}

output "table-info-list" {
  value       = module.dynamodb_table.table-info-list
  description = "DynamoDB table mapping"
}