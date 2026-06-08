locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# Application data storage — pinned to v1.0.0 of the storage module.
# Renovate tracks git tags on the GitHub repo and will open a PR to bump this ref.
module "app_data_storage" {
  source = "git::https://github.com/YOUR_GITHUB_USER/terraform-azurerm-storage-module.git?ref=v1.0.0"

  storage_account_name = "${var.project_name}${var.environment}data"
  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  replication_type     = "GRS"
  enable_versioning    = true
  tags                 = local.common_tags
}

# Logs storage — separate instance of the same module, also pinned to v1.0.0.
module "logs_storage" {
  source = "git::https://github.com/YOUR_GITHUB_USER/terraform-azurerm-storage-module.git?ref=v1.0.0"

  storage_account_name = "${var.project_name}${var.environment}logs"
  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  replication_type     = "LRS"
  enable_versioning    = false
  tags                 = local.common_tags
}
