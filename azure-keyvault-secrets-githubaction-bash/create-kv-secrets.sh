RG="tamopskvrg"
LOCATION="uksouth"
KV_NAME="tamopskvexample"

# Create a resource group.
az group create --name $RG --location $LOCATION

# Create a key vault.
az keyvault create --name $KV_NAME --resource-group $RG --location $LOCATION

# Create secrets in the key vault.
az keyvault secret set --vault-name $KV_NAME --name "example1" --value "example1secretvalue"
az keyvault secret set --vault-name $KV_NAME --name "example12" --value "example2secretvalue"
