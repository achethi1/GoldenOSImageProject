packer {
    required_plugins {
        azure = {
            version = "= 1.4.3"
            source = "github.com/hashicorp/azure"
        }
        ansible = {
            version = ">= 1.1.0"
            source = "github.com/hashicorp/ansible"
        }
    }
}

variable "client_id" {
    type = string
    default = ""
}
variable "client_secret" {
    type = string
    default = ""
    sensitive = true
}
variable "subscription_id" {
    type = string
    default = ""
    sensitive = true
}
variable "tenant_id" {
    type = string
    default = ""
}
variable "image_offer" {
    type = string
    default = ""
}
variable "image_publisher" {
    type = string
    default = ""
}
variable "image_sku" {
    type = string
    default = ""
}
variable "os_type" {
    type = string
    default = ""
}
variable "vm_size" {
    type = string
    default = ""
}
variable "managed_image_name" {
    type = string
    default = ""
}
variable "managed_image_resource_group_name" {
    type = string
    default = ""
}
variable "build_resource_group_name" {
    type = string
    default = ""
}
variable "virtual_network_name" {
    type = string
    default = ""
}
variable "virtual_network_resource_group_name" {
    type = string
    default = ""
}
variable "virtual_network_subnet_name" {
    type = string
    default = ""
}

source "azure-arm" "Image"{
    azure_tags = {
        # INCLUDE ALL NECESSARY TAGS
    }
    plan_info {
        plan_name = "var.image_sku"
        plan_product = "var.image_offer"
        plan_publisher = "var.image_publisher"
    }
    client_id                               = var.client_id
    client_secret                           = var.client_secret
    tenant_id                               = var.tenant_id
    image_offer                             = var.image_offer
    image_publisher                         = var.image_publisher
    image_sku                               = var.image_sku
    managed_image_name                      = var.managed_image_name
    managed_image_resource_group_name       = var.managed_image_resource_group_name
    build_resource_group_name               = var.build_resource_group_name
    os_type                                 = var.os_type
    vm_size                                 = var.vm_size
    subscription_id                         = var.subscription_id
    virtual_network_name                    = var.virtual_network_name
    virtual_network_subnet_name             = var.virtual_network_subnet_name
    virtual_network_resource_group_name     = var.virtual_network_resource_group_name
    temp_compute_name                       = "VM-name"
}

build {
    sources = ["source.azure-arm.Image"]
    provisioner "ansible" {playbook_file = "playbook.yml"}
}