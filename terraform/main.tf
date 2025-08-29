# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-resource-group"
  location = var.location
}

# 2. Storage Account
resource "azurerm_storage_account" "static" {
  name                     = var.storage_account_name # must be globally unique, lowercase
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"  # you can customize this as needed
  }
  
}


# Output the site URL
output "static_site_url" {
  value = azurerm_storage_account.static.primary_web_endpoint
}

output "azure_storage_account_name" {
  value = azurerm_storage_account.static.name
}