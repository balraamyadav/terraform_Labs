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


# resource "azurerm_resource_group" "rg1" {
#   name     = "rg-balram"
#   location = "West Europe"
# }

resource "azurerm_resource_group" "rg1" {
  name     = "rutuja1"
  location = "West Europe"
}

# resource "azurerm_resource_group" "rg2" {
#   name     = "rg-balram_dusra"
#   location = "West Europe"
# }