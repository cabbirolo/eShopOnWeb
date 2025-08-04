# resource "azurerm_resource_group" "az400-rg-01" {
#   name     = "az400cb-rg-01"
#   location = "East US"
# }

# output "name" {
#   value = azurerm_resource_group.az400cb-rg-01.name
  
# }

resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "az400cb-vm1"
  resource_group_name             = "AZ400-RG1"
  location                        = centralus
  size                            = "Standard_B1s"
  computer_name                   = "az400cb-vm1"
  admin_username                  = "carlos"
  admin_password                  = "Password1!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.vm1.id,
  ]

  os_disk {
    name                 = "vm1_os_disk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
   } 


# If windows

# source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-datacenter-gensecond"
#     version   = "latest"


#   }

  tags = {
    environment = "Buceta"
  }
}
