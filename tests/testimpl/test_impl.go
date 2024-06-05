package common

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestDnsZone(t *testing.T, ctx types.TestContext) {

	t.Run("TestDnsZone", func(t *testing.T) {
		dnsZoneId := terraform.Output(t, ctx.TerratestTerraformOptions(), "id")
		resourceGroupId := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_id")

		assert.NotEmpty(t, dnsZoneId, "DNS Zone ID must not be empty")
		assert.NotEmpty(t, resourceGroupId, "Resource Group ID must not be empty")

	})
}
