
resource "azurerm_virtual_network" "MY-VNET" {
  name                = "MY-VNET"
  address_space       = ["10.0.0.0/16", "172.0.0.0/16"]
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name

   
}

resource "azurerm_subnet" "Function-Subnet" {
  name                 = "First-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.1.0/24"]
  

  

}

resource "azurerm_subnet" "APIM-Subnet" {
  name                 = "Second-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.2.0/24"]

 
}


resource "azurerm_subnet" "AKS-Subnet" {
  name                 = "Third-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.3.0/24"]

}

resource "azurerm_subnet" "WebApp-Subnet" {
  name                 = "Fourth-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.4.0/24"]
  
 


}

resource "azurerm_subnet" "PE-Subnet" {
  name                 = "Fifth-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.5.0/24"]
  

}

resource "azurerm_subnet" "VM-Subnet" {
  name                 = "Sixth-Subnet"
  resource_group_name  = azurerm_resource_group.MY-RG.name
  virtual_network_name = azurerm_virtual_network.MY-VNET.name
  address_prefixes     = ["10.0.6.0/24"]
}

