resource "azurerm_resource_group" "sample" {
    provider = azurerm.Azure
    name = "Azure_Sample"
    location = "East US"
}


resource "azuread_user" "student" {
    provider = azurerm.Azure
    user_principal_name = "raadjalatchumy.ravi@fdmgroup.com"
    display_name = "Ravi"
}
resource "azuread_user" "trainer" {
    provider = azurerm.Azure
    user_principal_name = "ibrahim@fdmgroup.com"
    display_name = "Ravi"
    force_password_change = true
}



resource "aws_s3_bucket" "example_1" {
  count = "${length(var.bucketname)}"
  name = "${element(var.bucketname,count.index )}"
  tags = {
    Env = "dev"
    Team = "DevOps"
  }
}

resource "aws_iam_user" "example" {
  for_each = toset(["ravi", "patel", "afsah","yiqu"])
  name     = each.value
}


resource "azurerm_storage_account" "storage_1" {
  name                     = "storageaccountazure1"
  resource_group_name      = azurerm_resource_group.sample.name
  location                 = azurerm_resource_group.sample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    id = "Azure Storage"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "TF-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.sample.location
  resource_group_name = azurerm_resource_group.sample.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.sample.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "TF-nic"
  location            = azurerm_resource_group.sample.location
  resource_group_name = azurerm_resource_group.sample.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "TF-vm"
  location              = azurerm_resource_group.sample.location
  resource_group_name   = azurerm_resource_group.sample.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
}