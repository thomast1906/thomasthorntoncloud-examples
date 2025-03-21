# Create Azure storage account and SMB share for Home Assistant backups
# Usage: ./create-storage.sh <resource-group> <location> <storage-account-name> <container-name>
# Example: ./create-storage.sh homeassistant uksouth homeassistantbkup backups
# This script creates an Azure storage account and file share for Home Assistant backups.

#!/bin/bash


# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <resource-group> <location> <storage-account-name> <container-name>"
    exit 1
fi

# Assign arguments to variables
RESOURCE_GROUP=$1
LOCATION=$2
STORAGE_ACCOUNT_NAME=$3
FILE_SHARE_NAME=$4
# Check if the storage account name is valid
if ! [[ $STORAGE_ACCOUNT_NAME =~ ^[a-z0-9]{3,24}$ ]]; then
    echo "Error: Storage account name must be between 3 and 24 characters long and can only contain lowercase letters and numbers."
    exit 1
fi
# Check if the resource group already exists
if az group exists --name "$RESOURCE_GROUP"; then
    echo "Resource group $RESOURCE_GROUP already exists."
else
    # Create a resource group
    az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
fi

Create a resource group
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
# Create a storage account
az storage account create --name "$STORAGE_ACCOUNT_NAME" --resource-group "$RESOURCE_GROUP" --location "$LOCATION" --sku Standard_LRS
# Create azure files
az storage share-rm create --name "$FILE_SHARE_NAME" --resource-group "$RESOURCE_GROUP" --storage-account $STORAGE_ACCOUNT_NAME --quota 1024 --enabled-protocols SMB
