resource "azurerm_network_interface" "nicblock" {
  for_each = var.nicvar
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.sn_data_module[each.key].id
    private_ip_address_allocation = "Dynamic"
 
}
}
