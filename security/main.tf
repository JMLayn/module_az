resource "azurerm_network_security_group" "WkstDemo" {
  name                = "WkstDemoNetSecGrp"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "WkstDemo" {
  name                      = "WkstDemoNIC"
  resource_group_name       = "${var.resource_group_name}"
  location                  = "${var.location}"
  network_security_group_id = "${azurerm_network_security_group.WkstDemo.id}"

  ip_configuration {
    name                          = "WkstDemoNICcfg"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${var.ip_address_id}"
  }
}

output "network_interface_id" {
  value = "${azurerm_network_interface.WkstDemo.id}"
}
