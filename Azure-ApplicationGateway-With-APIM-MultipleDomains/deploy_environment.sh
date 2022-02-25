# Variables

#Resource Group
LOCATION="UKSOUTH"
RG_NAME="tamops-appgw-apim"

#Virtual Network
VNET_NAME="tamops-apim-vnet"
VNET_ADDRESS_PREFIX="10.0.0.0/16"
SUBNET_APPGW_NAME="appgw-subnet"
SUBNET_APPGW_PREFIX="10.0.0.0/24"
SUBNET_APIM_NAME="apim-subnet"
SUBNET_APIM_PREFIX="10.0.1.0/24"
SUBNET_VM_NAME="vm-subnet"
SUBNET_VM_PREFIX="10.0.2.0/24"

#Network Security Group
NSG_NAME="tamops-apim-nsg"
LOCATION_IP="1.2.3.4"

#Virtual Machine
VM_NAME="tamops-apim-vm"
VM_PIP_NAME="tamops-apim-vm-pip"


# Create Resource Group
az group create -l $LOCATION -n $RG_NAME

# Create Virtual Network
az network vnet create \
  --name $VNET_NAME \
  --resource-group $RG_NAME \
  --location $LOCATION \
  --address-prefix $VNET_ADDRESS_PREFIX \
  --subnet-name $SUBNET_APPGW_NAME \
  --subnet-prefix $SUBNET_APPGW_PREFIX

# Create Additional Subnets
az network vnet subnet create \
  --address-prefix $SUBNET_APIM_PREFIX \
  --name $SUBNET_APIM_NAME \
  --resource-group $RG_NAME \
  --vnet-name $VNET_NAME

az network vnet subnet create \
  --address-prefix $SUBNET_VM_PREFIX \
  --name $SUBNET_VM_NAME \
  --resource-group $RG_NAME \
  --vnet-name $VNET_NAME

# Create NSG
az network nsg create --resource-group $RG_NAME --name $NSG_NAME --location $LOCATION

# Create NSG rules
az network nsg rule create \
  --resource-group $RG_NAME \
  --nsg-name $NSG_NAME \
  --name RDP \
  --access Allow \
  --protocol Tcp \
  --direction Inbound \
  --priority 100 \
  --source-address-prefixes $LOCATION_IP \
  --source-port-range "*" \
  --destination-address-prefix "*" \
  --destination-port-range 3389

az network nsg rule create \
  --resource-group $RG_NAME \
  --nsg-name $NSG_NAME \
  --name apimanagement \
  --access Allow \
  --protocol Tcp \
  --direction Inbound \
  --priority 101 \
  --source-address-prefix ApiManagement \
  --source-port-range "*" \
  --destination-address-prefix "*" \
  --destination-port-range 3443

# Assign NSGs to subnets
az network vnet subnet update \
  --vnet-name $VNET_NAME \
  --name $SUBNET_APIM_NAME \
  --resource-group $RG_NAME \
  --network-security-group $NSG_NAME

az network vnet subnet update \
  --vnet-name $VNET_NAME \
  --name $SUBNET_VM_NAME \
  --resource-group $RG_NAME \
  --network-security-group $NSG_NAME

# Create VM
az network public-ip create \
  --resource-group $RG_NAME \
  --name $VM_PIP_NAME

az network nic create \
  --resource-group $RG_NAME \
  --name $VM_NAME \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_VM_NAME \
  --network-security-group $NSG_NAME \
  --public-ip-address $VM_PIP_NAME

az vm create \
  --resource-group $RG_NAME \
  --name $VM_NAME \
  --nics $VM_NAME \
  --image Win2019Datacenter \
  --admin-username tamops