variable "name_prefix"{
    type = string
    description = "Name prefix for the all resources"
}

variable "storage_account_name"{
    type = string
    description = "A Globally Unique name for the storage account"
}

variable "location"{
    type = string
    description = "Azure region to deploy resources in"
}