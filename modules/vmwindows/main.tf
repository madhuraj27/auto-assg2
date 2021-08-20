resource "azurerm_windows_virtual_machine" "vmwindows" {
  tags                  = local.common_tags
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.rg_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.username
  admin_password        = var.password

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.wos_disk_attributes["wos_disk_caching"]
    storage_account_type = var.wos_disk_attributes["wos_storage_account_type"]
    disk_size_gb         = var.wos_disk_attributes["wos_disk_size"]
  }
  winrm_listener {
    protocol = "Http"
  }

  source_image_reference {
    publisher = var.win_publisher
    offer     = var.win_offer
    sku       = var.win_sku
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account.primary_blob_endpoint
  }
}

resource "azurerm_virtual_machine_extension" "group5-windowsantimalware" {
name                 = "windowsantimalware"
for_each              = var.windows_name
virtual_machine_id   = azurerm_windows_virtual_machine.vmwindows[each.key].id
publisher            = "Microsoft.Azure.Security"
type                 = "IaaSAntimalware"
type_handler_version = "1.3"
auto_upgrade_minor_version = "true"

settings = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "RealtimeProtectionEnabled": "true",
        "ScheduledScanSettings": {
            "isEnabled": "true",
            "day": "1",
            "time": "120",
            "scanType": "Quick"
            },
        "Exclusions": {
            "Extensions": "",
            "Paths": "",
            "Processes": ""
            }
    }
SETTINGS

tags = local.common_tags
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  tags                = local.common_tags
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  depends_on = [
    var.rg_name,
    var.vnet,
  ]
  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  tags                = local.common_tags
  domain_name_label   = each.key
  name                = "${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
}

