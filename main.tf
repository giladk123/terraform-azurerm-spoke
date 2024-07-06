module "resource-group" {
  source = "./modules/resource-group"

  resource_groups = var.resource_groups
  
}