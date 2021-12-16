output "resource_group" {
  value = {
    name     = azurerm_resource_group.Resource-Group.name
    id       = azurerm_resource_group.Resource-Group.id
    location = azurerm_resource_group.Resource-Group.location
  }
}

output "app_service" {
  value = {
    name     = azurerm_app_service.Web-app.name
    hostname = azurerm_app_service.Web-app.default_site_hostname
  }
}