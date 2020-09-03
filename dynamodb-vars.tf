#This would be generally empty to facilitate multiple table creation from the same .tf file
# You can set any variable if its going to be applicable to all tables

variable "dynamo_enable_replica" {
  type        = bool
  default     = true
  description = "Enable /Disable DynamoDB Replica Tables"
}

variable "dynamo_replica_region" {
  type        = string
  default     = ""
  description = "Region for DynamoDB Replica Tables"
}

variable "table_def" {
  type        = any
  default     = {}
  description = "DynamoDB Table Definition"
}