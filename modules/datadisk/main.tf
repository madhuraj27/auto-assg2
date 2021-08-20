resource "azurerm_managed_disk" "data_disk_vmlinux" {
  count                = length(var.vmlinux_id)
  name                 = "${element(var.vmlinux_name[*], count.index + 1)}"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_acc_type
  create_option        = "Empty"
  disk_size_gb         = "10"
  depends_on = [
    var.vmlinux_name,
  ]
  tags = local.common_tags
}

resource "azurerm_managed_disk" "data_disk_vmwindows" {
  count                = length(var.vmwindows_id)
  name                 = "vmwindows_datadisk"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_acc_type
  create_option        = "Empty"
  disk_size_gb         = "10"
  depends_on = [
    var.windows_name,
  ]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_data_disk_attachment" {
  count              = var.nb_count_linux
  managed_disk_id    = element(azurerm_managed_disk.data_disk_vmlinux[*].id, count.index + 1)
  virtual_machine_id = element(var.vmlinux_id[*], count.index)
  lun                = 0
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.data_disk_vmlinux]
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk_attachment" {
  count              = var.nb_count_windows
  managed_disk_id    = element(azurerm_managed_disk.data_disk_vmwindows[*].id, count.index + 1)
  virtual_machine_id = element(var.vmwindows_id[*], count.index)
  lun                = 0
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.data_disk_vmwindows]
}