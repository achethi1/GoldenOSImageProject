#VALUES PULLED FROM AZURE VARIABLE GROUP

client_id = "$(client_id)"
client_secret = "$(client_secret)"
tenant_id = "$(tenant_id)"
subscription_id = "$(subscription_id)"

# IMAGE INFORMATION FOR WINDOWS 

os_type = "Windows"
image_offer = "cis-windows-server-2019-v1-0-0-l1"
image_publisher = "center-for-internet-security-inc"
image-sku = "18_04_lts-gen2"

vm_size = "Standard_B2ms"
managed_image_name = "image_name"
managed_image_resource_group_name = "resource-group-name"
build_resource_group_name = "resource-group-name"

# NETWORK INFORMATION

virtual_network_name = "VNET-NAME"
virtual_network_subnet_name = "VNET_subnet-NAME"
virtual_network_resource_group_name = "VNET-rg-NAME"