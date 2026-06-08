variable "project_name" {
  description = "Name of the project (lowercase alphanumeric, used in resource names)"
  type        = string
  default     = "myapp"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region to deploy into"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-myapp-dev"
}
