module "rgmodule" {
    source = "./RG"
    rgvar=var.rgdetails
  
}

module "vnetmodule" {
    depends_on = [ module.rgmodule ]
    source = "./VNET"
    vnetvar = var.vnetdetails
  
}
module "subnetmodule" {
    depends_on = [ module.vnetmodule ]
    source = "./SUBNET"
    subnetvar=var.subnetdetails  
}
module "pipmodule" {
  depends_on =[module.rgmodule]
  source = "./PIP"
  pipvar=var.pipdetails
}
module "nicmodule" {
  depends_on =[module.subnetmodule,module.pipmodule]
  source = "./NIC"
  nicvar=var.nicdetails
}
module "vmmodule" {
  depends_on =[module.nicmodule]
  source = "./VM"
  vmvar = var.vmdetails
}

