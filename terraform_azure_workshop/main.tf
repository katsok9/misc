# Configure the Azure Provider
provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "myfirstrg" {
  name = "${var.rg_name}"
  location = "${var.rg_location}"

  tags {
    environment = "production"
  }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myfirstntwk" {
  name = "${var.vn_name}"
  address_space = "${var.vn_addr_space}"
  location = "${azurerm_resource_group.myfirstrg.location}"
  resource_group_name = "${azurerm_resource_group.myfirstrg.name}"
}


resource "azurerm_subnet" "myfirstsubnet" {
  name = "${var.sb_name}"
  resource_group_name = "${azurerm_resource_group.myfirstrg.name}"
  virtual_network_name = "${azurerm_virtual_network.myfirstntwk.name}"
  address_prefix = "${var.sb_address_prefix}"
}
output "sb_address_prefix"
{
  value = "${azurerm_subnet.myfirstsubnet.address_prefix}"
}


output "vn_address_space" {
  value = "${azurerm_virtual_network.myfirstntwk.address_space}"
}

output "sb_id" {
  value = "${azurerm_virtual_network.myfirstntwk.id}"
}

module "example" {
  source              = "Azure/compute/azurerm"
  location            = "${azurerm_resource_group.myfirstrg.location}"
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["akakadushbag0workshop"] // change to a unique name per datacenter region
  vnet_subnet_id      = "${azurerm_subnet.myfirstsubnet.id}"
}