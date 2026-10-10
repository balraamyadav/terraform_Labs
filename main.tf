# Create a resource group
resource "azurerm_resource_group" "balram_rg0" {
  name     = "dev_balramrg0"
  location = "West India"
}

resource "azurerm_storage_account" "balram_stg0" {
  name                     = "storageaccountbalram0"
  resource_group_name      = azurerm_resource_group.balram_rg0.name
  location                 = azurerm_resource_group.balram_rg0.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

# 3. Create the Storage Container inside the Storage Account
resource "azurerm_storage_container" "balram_container0" {
  name                  = "my-container"
  storage_account_id    = azurerm_storage_account.balram_stg0.id
  container_access_type = "private" # Options: private, blob, container
}

