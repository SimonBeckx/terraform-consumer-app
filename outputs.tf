output "app_data_storage_id" {
  description = "ID of the application data storage account"
  value       = module.app_data_storage.storage_account_id
}

output "app_data_primary_blob_endpoint" {
  description = "Primary blob endpoint of the application data storage account"
  value       = module.app_data_storage.primary_blob_endpoint
}

output "logs_storage_id" {
  description = "ID of the logs storage account"
  value       = module.logs_storage.storage_account_id
}
