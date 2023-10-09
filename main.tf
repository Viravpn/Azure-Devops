provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "devops"
    storage_account_name  = "virterraformst"
    container_name        = "adanitstate"
    key                   = "terraform.tfstate"

  }

}


resource "azurerm_resource_group" "virDevops" {
  name     = "virTFDevops"
  location = "East US"
}

resource "azurerm_virtual_network" "virDevops" {
  name                = "vir-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.virDevops.location
  resource_group_name = azurerm_resource_group.virDevops.name
}