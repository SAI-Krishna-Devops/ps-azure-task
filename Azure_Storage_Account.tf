resource "random_string" "my_id" {
  
  keepers = {

    resource_group = azurerm_resource_group.MY-RG.name
  }
  length      = 12
  special     = false
  upper       = false
  min_lower   = 5
  min_numeric = 4
}

resource "azurerm_storage_account" "ready-refresh-storage-account" {
  name                     = "storageac${random_string.my_id.id}"
  location            =  azurerm_resource_group.MY-RG.location
  resource_group_name =  azurerm_resource_group.MY-RG.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Network Interface"
        "Application ID" = "1234"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
   
}
