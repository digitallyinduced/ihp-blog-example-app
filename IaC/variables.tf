variable "prefix" {
  description = "Project prefix for the resource names"
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
