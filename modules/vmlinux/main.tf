resource "azurerm_availability_set" "av_set" {
  name                = var.avs
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  tags                  = local.common_tags
  for_each              = var.vmlinux_name
  name                  = each.key
  resource_group_name   = var.rg_name
  location              = var.location
  availability_set_id   = azurerm_availability_set.av_set.id
  network_interface_ids = [azurerm_network_interface.vm1_nic[each.key].id]
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.username
  depends_on            = [azurerm_availability_set.av_set]

  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk_attributes["los_disk_caching"]
    storage_account_type = var.os_disk_attributes["los_storage_account_type"]
  }

  source_image_reference {
    publisher = var.ubuntu_os_info["los_publisher"]
    offer     = var.ubuntu_os_info["los_offer"]
    sku       = var.ubuntu_os_info["los_sku"]
    version   = var.ubuntu_os_info["los_version"]
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account.primary_blob_endpoint
  }
}

# resource "azurerm_virtual_machine_extension" "OMSExtension" {
#   for_each = var.vmlinux_name
#   name     = "OMSExtension"

#   virtual_machine_id         = azurerm_linux_virtual_machine.vmlinux[each.key].id
#   publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
#   type                       = "OmsAgentForLinux"
#   type_handler_version       = "1.12"
#   auto_upgrade_minor_version = "true"
#   depends_on = [
#     azurerm_linux_virtual_machine.vmlinux,
#     null_resource.linux_provisioner,
#   ]
#   tags = local.common_tags
# }

resource "azurerm_network_interface" "vm1_nic" {
  for_each            = var.vmlinux_name
  tags                = local.common_tags
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.vm1_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "vm1_pip" {
  for_each            = var.vmlinux_name
  tags                = local.common_tags
  domain_name_label   = each.key
  name                = "${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}


