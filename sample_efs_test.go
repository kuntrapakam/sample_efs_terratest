package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsNetworkExample(t *testing.T) {
	t.Parallel()

	awsRegion := "us-east-1"

	vpcCidr := "10.10.0.0/16"
	subnetCidr := "10.10.1.0/24"
	availabiltyZone := "us-east-1a"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: ".",

		Vars: map[string]interface{}{
			"main_vpc_cidr":     vpcCidr,
			"subnet_cidr":       subnetCidr,
			"aws_region":        awsRegion,
			"availability_zone": availabiltyZone,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	subnetId := terraform.Output(t, terraformOptions, "subnet_id")

	fmt.Println(subnetId)
}
