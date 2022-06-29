resource "azurerm_public_ip" "lb_pip" {
  name                    = var.lb_pip_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Static"
  domain_name_label       = "dns-lb-0195934"
  idle_timeout_in_minutes = 30
  tags                    = local.common_tags
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.common_tags

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-address-pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "nic-lb-address-pool" {
  for_each                = var.vm_network_interface_id
  network_interface_id    = var.vm_network_interface_id[each.key]
  ip_configuration_name   = var.nic_ip_config_name[each.key]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-address-pool.id
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "ssh-running-probe"
  port            = 22
}