variable "rg_name" {
  type = "string"
  default = "myfirstresourcegroup"
  description = "This variable defines the name of the virtual network"
}

variable "rg_location" {
  type = "string"
  default = "West US"
  description = "This variable defines the location of the resource group"
}

variable "vn_addr_space" {
  type = "list"
  default = [
    "10.0.0.0/16"]
  description = "This is the default open network"
}

variable "vn_name" {
  type = "string"
  default = "myfirstvn"
  description = "This variable defines the virtual network name"
}

variable "subnet_name_pref" {
  type = "string"
  default = "mysubnet"
  description = "This variable defines the subnet prefix name"
}

variable "sb_name" {
  type = "string"
  default = "mysubnetx"
  description = "This variable defines the subnet name"
}
variable "sb_address_prefix" {
  default = "10.0.3.0/24"
}

