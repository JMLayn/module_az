output "IP ADDRESS" {
  value = "${data.azurerm_public_ip.WkstDemo.ip_address}"
}
