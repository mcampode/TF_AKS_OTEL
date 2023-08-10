terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
    azuread = {
      version = "~> 2.9.0"
    }
  }
}

