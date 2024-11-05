variable "location" {
    default = "West US"
}

variable "resource_group_name" {
    default = "AZUREAKSDEV"
}

variable "acr_name" {
    default = "testingdevpoc"
}

variable "vnet_name" {
    default = "testingakspoc"
}

variable "subnet_name" {
    default = "publicsubnet"
}

variable "aks_cluster_name" {
    default = "AKSPOC"
}

variable "node_count" {
    default = "1"
}

variable "node_size" {
    default = "Standard_D4ps_v5"
}
