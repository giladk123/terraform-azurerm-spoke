## Usage

```terraform

locals {
  resource_group          = jsondecode(file("./ccoe/rg.json"))
  vnet_settings           = jsondecode(file("./network/vnet.json"))
}

module "spoke" {
  source  = "app.terraform.io/hcta-azure-dev/spoke/azurerm"
  version = "1.0.4"
 
  resource_groups = local.resource_group.resource_groups
  vnets = local.vnet_settings.vnets
  providers = {
    azurerm = azurerm.subscription1
  }
}
```

JSON Examples

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
