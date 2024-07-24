terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"

  #  # Connection to Azure
  #  subscription_id = var.subscription_id
  #  client_id       = var.client_id
  #  client_secret   = var.client_secret
  #  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "demo" {
  name     = "final-lab-demo"
  location = var.location
}

resource "azurerm_network_security_group" "allow-ssh" {
  name                = "${var.prefix}-allow-ssh"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.ssh-source-address
    destination_address_prefix = "*"
  }
}
