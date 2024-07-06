## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.81.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource-group"></a> [resource-group](#module\_resource-group) | ./modules/resource-group | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./modules/vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Map of resource group details | <pre>map(object({<br>    rg_location = string<br>    rg_tags     = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | n/a | `map(any)` | n/a | yes |

## Outputs

No outputs.
