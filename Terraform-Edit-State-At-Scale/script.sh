#!/bin/bash
set -e

RESOURCE_GROUP="tamops"
VNET_NAME="tamops-vnet"
SUBSCRIPTION="XXXXXXXXXXXXXXXXXX"

SUBNETS=()
SUBNETS+=("subnet1" "subnet2" "subnet3" "subnet4" "subnet5" "subnet6" "subnet7" "subnet8" "subnet9")

for i in "${!SUBNETS[@]}"; do

SUBNET_CHECK=()
SUBNET_CHECK=($(az network vnet subnet list -g $RESOURCE_GROUP --vnet-name $VNET_NAME --query "[?name=='${SUBNETS[i]}']" -o tsv))
 
if [ -n "$SUBNET_CHECK" ]
then
    terraform import azurerm_subnet.${SUBNETS[i]} /subscriptions/$SUBSCRIPTION/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/virtualNetworks/$VNET_NAME/subnets/${SUBNETS[i]}
else
    echo "${SUBNETS[i]} is not created"
fi

done

