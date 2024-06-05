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

output "resource_group_name" {
  description = "Name of the Resource Group."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the Resource Group."
  value       = module.resource_group.id
}

output "zone_name" {
  description = "Name of the private hosted zone."
  value       = module.private_dns_zone.zone_name
}

output "zone_id" {
  description = "ID of the private DNS Zone"
  value       = module.private_dns_zone.id
}

output "number_of_record_sets" {
  description = "The current number of record sets in this Private DNS zone."
  value       = module.private_dns_zone.number_of_record_sets
}

output "max_number_of_record_sets" {
  description = "The maximum number of record sets that can be created in this Private DNS zone."
  value       = module.private_dns_zone.max_number_of_record_sets
}

output "max_number_of_virtual_network_links" {
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
  value       = module.private_dns_zone.max_number_of_virtual_network_links
}

output "max_number_of_virtual_network_links_with_registration" {
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
  value       = module.private_dns_zone.max_number_of_virtual_network_links_with_registration
}

output "virtual_network_links" {
  description = "The virtual network links in this Private DNS zone."
  value       = { for link_name, vnet_id in var.virtual_network_links : link_name => module.vnet_links[link_name].id }
}
