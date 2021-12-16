
# Create a Resource Group
resource "azurerm_resource_group" "Resource-Group" {
  name     = var.rgname
  location = var.location

  tags = {
    Billing    = var.billing
    "IT Service" = var.it_service
    Env        = var.tags_env
  }
}

# Create the App Service Plan
resource "azurerm_app_service_plan" "App-Service-Plan" {
  name                = var.asp_name
  location            = azurerm_resource_group.Resource-Group.location
  resource_group_name = azurerm_resource_group.Resource-Group.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.appservice_plan_tier
    size = var.appservice_plan_size
  }

  tags = {
    Billing    = var.billing
    "IT Service" = var.it_service
    Env        = var.tags_env
  }
}

# Create the App Service
resource "azurerm_app_service" "Web-app" {
  name                = var.webapp_name
  location            = azurerm_resource_group.Resource-Group.location
  resource_group_name = azurerm_resource_group.Resource-Group.name
  app_service_plan_id = azurerm_app_service_plan.App-Service-Plan.id
  https_only          = true

  site_config {
    always_on        = true
    min_tls_version  = 1.2
  }

  backup {
    name                 = var.backupname
    storage_account_url  = "https://${azurerm_storage_account.storage_name.name}.blob.core.windows.net/${var.container_name}${data.azurerm_storage_account_sas.sas_key.sas}&sr=b"
    schedule {
      frequency_interval = 1
      frequency_unit     = "Day"
    }
  }

  tags = {
    Billing    = var.billing
    "IT Service" = var.it_service
    Env        = var.tags_env
  }
}
