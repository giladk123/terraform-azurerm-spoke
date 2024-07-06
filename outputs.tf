output "resource-groups" {
  description = "shows All resource groups created in the subscription"
  value       = module.resource-group.resource_groups
}