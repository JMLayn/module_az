#-------------network/main.tf----------
resource "azurerm_virtual_network" "WkstDemo" {
  name                = "WkstDemoVNET"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "WkstDemo" {
  name                 = "WkstDemoSubnet"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.WkstDemo.name}"
  address_prefix       = "10.0.0.0/24"
}

resource "azurerm_public_ip" "WkstDemo" {
  name                = "WkstDemoPublicIp"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  allocation_method   = "Dynamic"
}

output "subnet_id" {
  value = "${azurerm_subnet.WkstDemo.id}"
}

output "ip_address_id" {
  value = "${azurerm_public_ip.WkstDemo.id}"
}
