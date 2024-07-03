// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 1.0"

  for_each = var.resource_names_map

  logical_product_family  = var.product_family
  logical_product_service = var.product_service
  region                  = var.region
  class_env               = var.environment
  cloud_resource_type     = each.value.name
  instance_env            = var.environment_number
  maximum_length          = each.value.max_length
  use_azure_region_abbr   = true
}

module "resource_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name     = module.resource_names["rg"].standard
  location = var.region

  tags = merge(local.tags, { resource_name = module.resource_names["rg"].standard })

}

module "private_dns_zone" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/private_dns_zone/azurerm"
  version = "~> 1.0"

  resource_group_name = module.resource_group.name
  zone_name           = var.zone_name
  soa_record          = var.soa_record

  tags = merge(local.tags, { zone_name = var.zone_name })

  depends_on = [module.resource_group]
}

module "vnet_links" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/private_dns_vnet_link/azurerm"
  version = "~> 1.0"

  for_each = var.virtual_network_links

  link_name             = each.key
  resource_group_name   = module.resource_group.name
  private_dns_zone_name = var.zone_name
  virtual_network_id    = each.value
  registration_enabled  = var.registration_enabled

  tags = merge({
    zone_name     = var.zone_name
    resource_name = each.key
  }, var.tags)

  depends_on = [module.private_dns_zone]
}
