# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.33.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "283b7b64-24dd-481d-98bf-a117f9168256"
}