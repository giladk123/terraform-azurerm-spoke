## Usage

```terraform

locals {
  resource_group          = jsondecode(file("./ccoe/rg.json"))
  vnet_settings           = jsondecode(file("./network/vnet.json"))
  keyvault_settings       = jsondecode(file("./ccoe/keyvault.json"))
}

module "spoke" {
  source  = "app.terraform.io/hcta-azure-dev/spoke/azurerm"
  version = "1.0.11"
 
  resource_groups = local.resource_group.resource_groups
  vnets = local.vnet_settings.vnets
  keyvaults = local.keyvault_settings.keyvaults
  providers = {
    azurerm = azurerm.subscription1
  }
}
```

Jsons Examples:

rg.json:

```json
{
    "resource_groups": {
        "we-ydev-azus-opdx-arutzim-rg": {
            "rg_location": "West Europe",
            "rg_tags": {
                "environment": "dev"
            }
        },
        "we-ydev-azus-opdx-marketing-rg": {
            "rg_location": "West Europe",
            "rg_tags": {
                "environment": "dev"
            }
        }
    }
}
```

vnet.json:

```json
{
    "vnets": {
        "we-ydev-azus-opdx-crm-vnet": {
            "resource_group_name": "we-ydev-azus-opdx-marketing-rg",
            "location": "westeurope",
            "address_space": ["10.62.252.0/24"],
            "tags": {"environment": "dev"},
            "subnets": [
                {"name": "keyvault", "address_prefix": "10.62.252.0/28"},
                {"name": "arutzim", "address_prefix": "10.62.252.16/28"}
        ]
        },
        "we-ydev-azus-opdx-marketing-vnet": {
            "resource_group_name": "we-ydev-azus-opdx-marketing-rg",
            "location": "westeurope",
            "address_space": ["10.62.253.0/24"],
            "tags": {"environment": "dev"},
            "subnets": [
                {"name": "marketing_app", "address_prefix": "10.62.253.0/28"},
                {"name": "crm", "address_prefix": "10.62.253.16/28"}
        ]
        }
    }
}
```

keyvault.json:

```json
{
    "keyvaults": {
        "we-ydev-azus-opdx-01-kv": {
            "location": "West Europe",
            "resource_group_name": "we-ydev-azus-opdx-arutzim-rg",
            "tenant_id": "233c7c56-1c47-4b81-a976-39ea1da0802a",
            "soft_delete_retention_days": 18,
            "purge_protection_enabled": true,
            "sku_name": "standard",
            "public_network_access_enabled": false
        },
        "we-ydev-azus-opdx-02-kv": {
            "location": "West Europe",
            "resource_group_name": "we-ydev-azus-opdx-arutzim-rg",
            "tenant_id": "233c7c56-1c47-4b81-a976-39ea1da0802a",
            "soft_delete_retention_days": 10,
            "purge_protection_enabled": true,
            "sku_name": "standard",
            "public_network_access_enabled": false
        }
    }
}
```

Outputs Examples:

```terraform
output "resource-groups" {
  value = module.spoke.resource-groups
  description = "value of resource-groups"
}

output "vnets" {
  value = module.spoke.vnets
  description = "value of vnets"
}

output "keyvaults" {
  description = "All keyvaults created in the subscription"
  value       = { for k, v in module.keyvault.keyvault : k => v }
}
```



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
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ./modules/keyvault | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvaults"></a> [keyvaults](#input\_keyvaults) | The keyvaults to create | `map(any)` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Map of resource group details | <pre>map(object({<br>    rg_location = string<br>    rg_tags     = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource-groups"></a> [resource-groups](#output\_resource-groups) | shows All resource groups created in the subscription |
| <a name="output_vnets"></a> [vnets](#output\_vnets) | shows All vnets created in the subscription |
