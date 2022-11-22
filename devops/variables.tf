variable "rg_name" {
    description = "The name of the resource group"
    default = "myResourceGroup"
}

variable "rg_location" {
    description = "The location of the resource group"
    default = "eastus2"
}

variable "app_service_plan_name" {
    description = "The name of the app service plan"
    default = "myAppServicePlan"
}

variable "app_name" {
    description = "The name of the app service"
    default = "myApp"
}

variable "app_image" {
    description = "The name of the app image"
    default = "maxkie/devops_ita"
}

variable "app_image_tag" {
    description = "The tag of the app image"
    default = "latest"
}

variable "app_port" {
    description = "The port of the app"
    default = "5000"
}
