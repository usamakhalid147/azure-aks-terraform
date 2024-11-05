provider "azurerm" {
    features {}
    #resource_provider_registrations = "none"
    subscription_id = "80a83f89-1022-4491-8116-5505e640a105"
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name 
    location = var.location
}

resource "azurerm_container_registry" "acr" {
    name  = var.acr_name 
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku      = "Basic"
    admin_enabled = true
}

resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = ["10.0.0.0/16"]    
}

resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]   
}

resource "azurerm_kubernetes_cluster" "aks" {
    name  = var.aks_cluster_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    dns_prefix = "${var.aks_cluster_name}-dns"

    default_node_pool {
        name   = "default" 
        node_count  = var.node_count
        vm_size    = var.node_size
        vnet_subnet_id = azurerm_subnet.subnet.id
    }

    identity {
        type ="SystemAssigned"
    }

    network_profile {
        network_plugin   = "azure"
        service_cidr  = "10.1.0.0/16"
        dns_service_ip   = "10.1.0.10"
    }
}
