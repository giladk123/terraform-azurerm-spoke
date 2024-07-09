variable "resource_groups" {
  description = "Map of resource group details"
  type = map(object({
    rg_location = string
    rg_tags     = map(string)
  }))
}

variable "vnets" {
   type = map(any)
}

variable "keyvaults" {
  description = "The keyvaults to create"
  type        = map(any)
}

variable "zones" {
  description = "A list of DNS zone names"
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}