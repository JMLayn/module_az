resource "azurerm_virtual_machine" "WkstDemo" {
  name                  = "WkstDemoVM"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = ["${var.network_interface_id}"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "WkstDemoOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  os_profile {
    computer_name  = "WkstDemo"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcHhLORvRvCej6WmChXBtS4nt70zdPZwOOARQ/CbUXcZgZBXhJEtHqpVuXWpi1GSxciGviXVnhqsTwiKGnvapD+ekwSDsX8rpCLQy0zjLwnEPUG284t2ZsuYtmjuQqsFVxo2vjmnLu+J70YAjnMtaWBeI13+G4e9iQOZoBXkUA/rAIyB08uRINuok9GwtoO7lyQu7Q2R4hpQbsduV5wF4Pqdxx2UkUmoXwScXLc4QlW3MvJMahKd8k6/1vNvf/bR8jITYuojoCk5wCKhOGFVZQEY+FzClX6VB3LmavikxgNhaPK3C7RWJXBwHsILGJM6H/xXFIaB3b5ihKdH+XkaFOmMYt8hggrIcyn50YPTzWSutjm48lnGtSN/c5ocA10eRAnu1ArUcrjrLQXPFv9GytlXU8BFvgOIaFBWFYbNR3tBdbB7R+coS6GcAAP18EXV+gyf9Wt+Femfh6F6YL1IAQxXIi7Z85sqoaGMIdNm9ZaafLQX310ZyUhbMtGpLqHace3TLCS3a6685ZbWgvfajITHMQ2T4S+nXvN2rbVeqRaNouCDEPJB+UQKeAfzXrr/OG6ZDb8apSe5MMEPj3z9O49f+vgdQv1dOpKWvNeutO8DeAS+9UiRVD4aC/iBttktiytLAs8vW0YXQoQN/Fc0jsZpwKQeE26cgy3mFqOdjxcQ== jlayn@hashicorp.com"
      # key_data = "${file("~/.ssh/jmlayn_rsa.pub")}"
    }
  }
}
