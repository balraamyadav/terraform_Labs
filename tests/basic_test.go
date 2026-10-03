package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformPlan(t *testing.T) {

	options := &terraform.Options{
		TerraformDir: "..",
	}

	terraform.Init(t, options)

	terraform.Validate(t, options)

	terraform.Plan(t, options)
}