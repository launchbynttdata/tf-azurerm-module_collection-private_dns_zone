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

provider "random" {}

resource "random_integer" "rand_int" {
  max = 200000
  min = 100000
}

module "private_dns_zone" {
  source = "../.."

  product_family     = var.product_family
  product_service    = "${var.product_service}${random_integer.rand_int.result}"
  environment        = var.environment
  environment_number = var.environment_number
  region             = var.region
  zone_name          = "example-${random_integer.rand_int.result}.com"

  tags = var.tags

}
