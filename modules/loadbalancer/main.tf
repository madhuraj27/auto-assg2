resource "azurerm_lb" "group5_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
  tags = local.common_tags
}

resource "azurerm_public_ip" "lb_ip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = var.rg_name
}

resource "azurerm_lb_backend_address_pool" "lb_back_address" {
  loadbalancer_id     = azurerm_lb.group5_lb.id
  name                = "BackEndAddressPool"
  resource_group_name = var.rg_name
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_netasso" {
  count = length(var.vmlinux_nic)
  network_interface_id    = element(var.vmlinux_nic[*].id, count.index)
  ip_configuration_name   = element(var.vmlinux_nic[*].ip_configuration[0].name,count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_back_address.id
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.group5_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_back_address.id
}

resource "azurerm_lb_rule" "lb_rule-01" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.group5_lb.id
  name                           = "LBRule-01"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_back_address.id
}

resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.group5_lb.id
  name                = "ssh-running-probe"
  port                = 22
}

resource "azurerm_lb_probe" "lb_probe_http" {
  resource_group_name = var.rg_name
  name                = "http-running-probe"
  loadbalancer_id     = azurerm_lb.group5_lb.id
  port                = "80"
}