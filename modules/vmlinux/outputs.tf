output "vmhostname" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].name
}

output "private_ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].private_ip_address
}

output "public_ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].public_ip_address
}

output "vmlinux_id" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].id
}

output "vmlinux_nic" {
  value = values(azurerm_network_interface.vm1_nic)[*]
}

output "storage_account" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].boot_diagnostics
}

output "vm_nic_ipconfig" {
  value = values(azurerm_network_interface.vm1_nic)[*].ip_configuration
}