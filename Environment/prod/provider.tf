terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "vivek-storage-account-rg"
    storage_account_name = "storage285001"
    container_name       = "container1"
    key                  = "vivek.tfstate02"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "5e63e763-8324-4d7c-b1f3-78689fc7dacc"
}
