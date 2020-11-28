resource_group       = 'azurefestive-production'
storage_account_name = 'azurefestiveprodsa'
blob_container_name  = '$web'

control 'Storage Account Blob Tests For' do
  title blob_container_name

  describe azure_storage_account_blob_container(resource_group: resource_group, storage_account_name: storage_account_name, name: blob_container_name)  do
    it { should exist }
  end

end

