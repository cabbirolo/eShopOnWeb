terraform {

  backend "azurerm" {
    resource_group_name  = "AZ400-RG1"
    storage_account_name = "az400cbsa01"
    container_name       = "az400cb-tfstate-con"
    key                  = "az400cb.terraform.tfstate"
    subscription_id     = "d9847f5e-f0cc-4201-a466-f97dd13bdf76"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {} 
}