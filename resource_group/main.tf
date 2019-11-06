#This module will set up the resouce group in Azure to

#-------------resource_group/main.tf----------
resource "azurerm_resource_group" "WkstDemo" {
  name     = "${var.resourceGroup}"
  location = "${var.resourceLocation}"

  tags = {
    x-do-not-remove = "${var.x-do-not-remove}"
    X-Contact       = "${var.X-Contact}"
    X-Application   = "${var.X-Application}"
    X-Dept          = "${var.X-Dept}"
    X-Customer      = "${var.X-Customer}"
    X-Project       = "${var.X-Project}"
  }
}
