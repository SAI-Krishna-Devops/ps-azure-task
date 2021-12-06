resource "azurerm_kubernetes_cluster" "AKS-Cluster" {
  name                    = "AKS-Cluster"
  location            =  azurerm_resource_group.MY-RG.location
  resource_group_name =  azurerm_resource_group.MY-RG.name
  dns_prefix              = "myaks"
  private_cluster_enabled = false
  kubernetes_version      = "1.20.9"
  node_resource_group     = "AKS-CLUSTER"
  
  
 
  default_node_pool {
    name                      = "default"
    vm_size                   = "Standard_DS2_v2"
    availability_zones        = ["1", "2", "3"]
    enable_auto_scaling       = true
    max_pods                  = 110
    type                      = "VirtualMachineScaleSets"
    node_count                = 2
    max_count                 = 5
    min_count                 = 2
 
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    docker_bridge_cidr = "172.17.0.1/16"  
    service_cidr       = "10.0.0.0/24"
    dns_service_ip     = "10.0.0.10"
    
  }


   role_based_access_control {
    enabled = true
        
  }

  tags = {

        "Application"  =  "Azure Kubernetes Cluster"
     }
 

}

resource "azurerm_kubernetes_cluster_node_pool" "AKS_Nodepool" {
  
  kubernetes_cluster_id = azurerm_kubernetes_cluster.AKS-Cluster.id
  vnet_subnet_id        = azurerm_subnet.AKS-Subnet.id
  name                      = "nodepool2"
  vm_size                   = "Standard_DS2_v2"
  os_type                  = "Linux"
  availability_zones        = ["1", "2", "3"]
  enable_auto_scaling       = true
  mode                      = "User"
  max_pods                  = 110
  os_disk_size_gb           = 64
  node_count                = 2
  max_count                 = 5
  min_count                 = 2

  tags = {

        "Application"  =  "AKS Extra Node Pool"
     }
  
}