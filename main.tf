#-------------root/main.tf----------

provider "azurerm" {
  version = "~>1.27.0"
}

module "resource_group" {
  source           = "./resource_group"
  resourceGroup    = "${var.resourceGroup}"
  resourceLocation = "${var.resourceLocation}"
  X-Customer       = "${var.X-Customer}"
  x-do-not-remove  = "${var.x-do-not-remove}"
  X-Contact        = "${var.X-Contact}"
  X-Application    = "${var.X-Application}"
  X-Dept           = "${var.X-Dept}"
  X-Project        = "${var.X-Project}"
}

module "network" {
  source              = "./network"
  resource_group_name = "${module.resource_group.rg_name}"
  location            = "${module.resource_group.rg_loc}"
}

module "security" {
  source              = "./security"
  resource_group_name = "${module.resource_group.rg_name}"
  location            = "${module.resource_group.rg_loc}"
  subnet_id           = "${module.network.subnet_id}"
  ip_address_id       = "${module.network.ip_address_id}"
}

module "compute" {
  source               = "./compute"
  resource_group_name  = "${module.resource_group.rg_name}"
  location             = "${module.resource_group.rg_loc}"
  network_interface_id = "${module.security.network_interface_id}"
}

data "azurerm_public_ip" "WkstDemo" {
  name                = "${module.network.name}"
  resource_group_name = "${module.resource_group.rg_name}"
}
