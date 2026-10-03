# kuchbhi{}

# kuchbhi "lable1" {}

# kuchbhi "lable1" "lable2" {}


terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.8.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "rutuja1"
  location = "West Europe"
}

resource "azurerm_management_lock" "rg_lock" {
  name       = "terraform-resource-lock"
  scope      = azurerm_resource_group.rg1.id
  lock_level = "CanNotDelete"
  notes      = "Protect Resource Group from accidental deletion"
}