output "subnet_id" {
  value = "${azurerm_subnet.WkstDemo.id}"
}

output "ip_address_id" {
  value = "${azurerm_public_ip.WkstDemo.id}"
}

output "name" {
  value = "${azurerm_public_ip.WkstDemo.name}"
}
