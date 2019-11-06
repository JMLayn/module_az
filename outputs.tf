output "IP_ADDRESS" {
  value = "${data.azurerm_public_ip.WkstDemo.ip_address}"
}
