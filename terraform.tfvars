rgdetails = {
  rg1 = {
    name     = "myrg"
    location = "west us"

  }}



vnetdetails = {
  vnet1 = {
    name                = "myvnet"
    location            = "west us"
    resource_group_name = "myrg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnetdetails = {
  sub1 = {
    name                 = "mysubnet"
    resource_group_name  = "myrg"
    virtual_network_name = "myvnet"
    address_prefixes     = ["10.0.0.0/24"]

  }
}
pipdetails = {
  pip1 = {
    name                = "mypip"
    resource_group_name = "myrg"
    location            = "west us"
    allocation_method   = "Static"
  }
}
nicdetails={
    nic1={
 name                = "mynic"
  resource_group_name = "myrg"
  location            = "west us"
  ip_configuration = {
    name                          = "myipconfig"
    private_ip_address_allocation = "Dynamic"
     
    public_ip_address_id          = "/subscriptions/8efc0510-5574-4749-93e2-d3aba44fbb73/resourceGroups/myrg/providers/Microsoft.Network/publicIPAddresses/mypip"
    subnet_id                     = "/subscriptions/8efc0510-5574-4749-93e2-d3aba44fbb73/resourceGroups/myrg/providers/Microsoft.Network/virtualNetworks/myvnet/subnets/mysubnet"
  }
    }
}
vmdetails={
    vm1={
name                            = "myvm"
  resource_group_name             = "myrg"
  location                        = "west us"
  size                            = "Standard_F2"
  admin_username                  = "admin123"
  admin_password                  = "Admin@12"
  disable_password_authentication = false
  network_interface_ids           = "/subscriptions/8efc0510-5574-4749-93e2-d3aba44fbb73/resourceGroups/myrg/providers/Microsoft.Network/networkInterfaces/mynic"
  os_disk ={
    caching              = "ReadWrite"
    storage_account_type = "Standard_F2"
  }
  source_image_reference ={
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
}
