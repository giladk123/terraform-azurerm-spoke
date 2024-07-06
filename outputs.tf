output "arutzim_resource_group_id" {
  description = "ID of the specific resource group"
  value       = module.resource-group.resource_groups["we-ydev-azus-opdx-arutzim-rg"].id
}