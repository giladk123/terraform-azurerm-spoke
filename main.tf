module "resource-group" {
  source = "./modules/resource-group"

  resource_groups = var.resource_groups
  
}

module "vnet" {
  source = "./modules/vnet"

  vnets = var.vnets

  depends_on = [module.resource-group]
}

module "keyvault" {
  source = "./modules/keyvault"

  keyvaults = var.keyvaults

  depends_on = [module.resource-group]

}

module "private-dns-zone" {
  source = "./modules/private-dns-zone"

  zones = var.zones
  resource_group_name = var.resource_group_name
  
}