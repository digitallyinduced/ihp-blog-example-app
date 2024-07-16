variable "prefix" {
  description = "Project prefix for the resource names"
  type        = string
}

variable "region" {
  description = "AWS Region to deploy to."
  type        = string
}

variable "az_1" {
  description = "Availability Zone 1. Used by the EBS (disk) and RDS (database) resource."
  type        = string
}

variable "az_2" {
  description = "Availability Zone 2. Used by the RDS resource. "
  type        = string
}

variable "key_name" {
  description = "The key name of the SSH key-pair"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}
