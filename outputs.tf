output "resource_group_name" {
  value = module.rgroup.rg_name
}

output "vnet_name" {
  value = module.network.virtual_network_name
}

output "vnet_ip_address" {
  value = module.network.virtual_network_address
}

output "subnet1_name" {
  value = module.network.subnet1
}

output "subnet1_address" {
  value = module.network.subnet1_address_prefix
}

output "linux_hostname" {
  value = module.vmlinux.vmhostname
}

output "linux_private_ip" {
  value = module.vmlinux.private_ip
}

output "linux_public_ip" {
  value = module.vmlinux.public_ip
}

output "windows_hostname" {
  value = module.vmwindows.windows_hostname
}

output "windows_private_ip" {
  value = module.vmwindows.windows_private_ip
}

output "windows_public_ip" {
  value = module.vmwindows.windows_public_ip
}

output "loadbalancer_name" {
  value = module.loadbalancer.lb_name
}

output "database_name" {
  value = module.database.database_name
}

output "law_name" {
  value = module.common.log_analytics_workspace.name
}

output "rsv_name" {
  value = module.common.recovery_services_vault.name
}

output "storage_account" {
  value     = module.common.storage_account
  sensitive = true
}

