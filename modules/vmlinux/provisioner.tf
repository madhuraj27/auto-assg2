resource "null_resource" "linux_provisioner" {
  for_each = var.vmlinux_name
  depends_on = [
  azurerm_linux_virtual_machine.vmlinux, azurerm_network_interface.vm1_nic, ]

  provisioner "local-exec" {
    command = "sleep 5; cat /etc/hostname"
  }
}
