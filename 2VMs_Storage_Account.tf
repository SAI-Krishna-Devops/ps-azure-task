// LINUX VM

resource "azurerm_network_interface" "Nic1" {
  name                = "MY-NIC01"
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name
  enable_accelerated_networking  = true
  ip_configuration {
    name                          = "IPConfiguration"
    subnet_id                     = azurerm_subnet.APIM-Subnet.id
    private_ip_address_allocation = "Dynamic"
    
  }

  tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Network Interface"
        "Application ID" = "1234"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
}

resource "azurerm_linux_virtual_machine" "Linux-VM1" {
  name                = "Linux-VM1"
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name
  size                = "Standard_D4s_v3"
  admin_username      = "saikriskna"
  admin_password      = "SaiKrishna@123"
  computer_name       = "Linux-VM1"
  network_interface_ids = [azurerm_network_interface.Nic1.id]
  availability_set_id   = null
  disable_password_authentication = false

  os_disk {
    name                 =  "Linux-VM1-OSDisk"
    disk_size_gb         =  128
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
  publisher = "RedHat"
  offer     = "RHEL-SAP-APPS"
  sku       = "82sapapps-gen2"
  version   = "latest"
  
  }

 boot_diagnostics {
    storage_account_uri = null
  }
  tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Network Interface"
        "Application ID" = "TBD"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
 
}

resource "azurerm_managed_disk" "vm1-disk" {
  name                 = "Linux-VM1-DataDisk" 
  create_option        = "Empty"
  disk_size_gb         =  128
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name
  storage_account_type =  "Premium_LRS"
   tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Network Interface"
        "Application ID" = "TBD"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm1-disk-attach" {
  managed_disk_id    = azurerm_managed_disk.vm1-disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.Linux-VM1.id
  lun                = 1
  caching            = "ReadWrite"
}


//  Windows VM

resource "azurerm_network_interface" "vm-nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.Function-Subnet.id
    private_ip_address_allocation = "Dynamic"
    
      }

   tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Network Interface"
        "Application ID" = "TBD"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
}

resource "azurerm_windows_virtual_machine" "windows-vm" {
  name                = "windows-vm"
  location            = azurerm_resource_group.MY-RG.location
  resource_group_name = azurerm_resource_group.MY-RG.name
  size                = "Standard_DS3_v2"
  admin_username      = "saikriskna"
  admin_password      = "SaiKrishna@123"
  network_interface_ids = [azurerm_network_interface.vm-nic.id]

  os_disk {
    name                 =  "windows-vm-OS-Disk"
    disk_size_gb         =  128
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher       = "MicrosoftWindowsServer"
  offer           = "WindowsServer"
  sku             = "2019-Datacenter"
  version         = "latest"
  }

   tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "Virtual Machine"
        "Application ID" = "TBD"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }

}