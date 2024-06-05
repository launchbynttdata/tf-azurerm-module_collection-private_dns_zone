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

output "zone_name" {
  value = module.private_dns_zone.zone_name
}

output "id" {
  value = module.private_dns_zone.zone_id
}

output "resource_group_name" {
  value = module.private_dns_zone.resource_group_name
}

output "resource_group_id" {
  value = module.private_dns_zone.resource_group_id
}

output "vnet_links" {
  value = module.private_dns_zone.virtual_network_links
}
