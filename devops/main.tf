# Configure the azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}
provider "azurerm" {
  features {}
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 1000
  max = 9999
}
  
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name = "${var.rg_name}-${random_integer.ri.result}"
  location = var.rg_location
}

# Create the app service plan
resource "azurerm_service_plan" "appserviceplan" {
    name = "${var.app_service_plan_name}-${random_integer.ri.result}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name =  "F1"
    os_type = "Linux"
}

# Create the app service
resource "azurerm_linux_web_app" "app" {
    name = "${var.app_name}-${random_integer.ri.result}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.appserviceplan.id
    site_config {
        always_on = false
        application_stack {
            docker_image = var.app_image
            docker_image_tag = var.app_image_tag
        }
    }
    app_settings = {
        "WEBSITES_PORT" = var.app_port
    }
}
