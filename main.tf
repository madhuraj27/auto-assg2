module "common" {
  source = "./modules/common"
  depends_on = [
    module.rgroup
  ]
  subnet_id = module.network.subnet1.id

}

module "database" {
  source = "./modules/database"
  depends_on = [
    module.rgroup
  ]
  subnet_id = module.network.subnet1.id
}

module "datadisk" {
  source = "./modules/datadisk"
  depends_on = [
    module.rgroup
  ]
  subnet_id    = module.network.subnet1.id
  vmlinux_id   = module.vmlinux.vmlinux_id
  vmwindows_id = module.vmwindows.vmwindows_id

}

module "loadbalancer" {
  source = "./modules/loadbalancer"
  depends_on = [
    module.rgroup
  ]
  subnet_id       = module.network.subnet1.id
  vmlinux_nic     = module.vmlinux.vmlinux_nic
  vm_nic_ipconfig = module.vmlinux.vm_nic_ipconfig
}

module "network" {
  source    = "./modules/network"
  subnet_id = module.network.subnet1.id
  depends_on = [
    module.rgroup
  ]
}

module "rgroup" {
  source = "./modules/rgroup"
}

module "vmlinux" {
  source          = "./modules/vmlinux"
  subnet_id       = module.network.subnet1.id
  storage_account = module.common.storage_account
  depends_on = [
    module.rgroup
  ]
}

module "vmwindows" {
  source = "./modules/vmwindows"
  depends_on = [
    module.rgroup
  ]
  subnet_id       = module.network.subnet1.id
  storage_account = module.common.storage_account
}
