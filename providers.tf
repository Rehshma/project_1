# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  alias = "Azure"
}

provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
}