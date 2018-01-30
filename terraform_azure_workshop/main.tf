# Configure the Azure Provider
provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "myfirstrg" {
  name     = "${var.rg_name}"
  location = "${var.rg_location}"

  tags {
    environment = "production"
  }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myfirstntwk" {
  name                = "${var.vn_name}"
  address_space       = "${var.vn_addr_space}"
  location            = "${azurerm_resource_group.myfirstrg.location}"
  resource_group_name = "${azurerm_resource_group.myfirstrg.name}"

  subnet {
    name           = "${var.subnet_pref}1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "${var.subnet_pref}2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "${var.subnet_pref}3"
    address_prefix = "10.0.3.0/24"
  }
}

output "vn_address_space" {
  value = "${azurerm_virtual_network.myfirstntwk.subnets.1.name}"
}
