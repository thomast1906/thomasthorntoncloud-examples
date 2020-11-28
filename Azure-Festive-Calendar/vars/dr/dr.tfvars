location                = "ukwest"
storage_account_name    = "azurefestivedrsa"
resource_group_name     = "azurefestive-dr"
sa_web_source           = "../vars/dr/index.html"

vnet_name               = "azurefestive-dr-vnet"
subnet_1_name           = "azurefestive-subnet1"
subnet_1_address_prefix = "10.0.0.0/24"
subnet_2_name           = "azurefestive-subnet2"
subnet_2_address_prefix = "10.0.1.0/24"

tag                     = "azurefestive-dr"