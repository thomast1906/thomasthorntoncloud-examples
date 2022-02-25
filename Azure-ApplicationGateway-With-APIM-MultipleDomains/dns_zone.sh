RG_NAME="tamops-appgw-apim"
DNS_ZONE_NAME="thomasthornton.cloud"
VNET_ID="/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/tamops-appgw-apim/providers/Microsoft.Network/virtualNetworks/tamops-apim-vnet"
API_DNS="api.thomasthornton.cloud"
API_IP_ADDRESS="10.0.1.5"

# Private DNS zone

az network private-dns zone create -g $RG_NAME -n $DNS_ZONE_NAME

az network private-dns link vnet create -g $RG_NAME -n linkzone -z $DNS_ZONE_NAME \
    -v $VNET_ID -e False

az network private-dns record-set a add-record -g $RG_NAME -z $DNS_ZONE_NAME \
    -n $API_DNS -a $API_IP_ADDRESS