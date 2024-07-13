output "resource-groups" {
  description = "shows All resource groups created in the subscription"
  value       = module.resource-group.resource_groups
}

output "vnets" {
  description = "shows All vnets created in the subscription"
  value       = module.vnet.vnet
}

output "subnets" {
  description = "shows All subnets created in the subscription"
  value       = module.vnet.subnet
  
}

output "keyvaults" {
  description = "All keyvaults created in the subscription"
  value       = { for k, v in module.keyvault.keyvault : k => v }
}

output "dns_zones" {
  description = "All DNS zones created in the subscription"
  value       = module.private-dns-zone.dns_zone_ids
}