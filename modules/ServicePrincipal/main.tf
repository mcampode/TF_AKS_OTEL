data "azuread_client_config" "current" {}

resource "azuread_application" "app_opentelemetry" {
  display_name = var.sp_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp_opentelemetry" {
  application_id               = azuread_application.app_opentelemetry.application_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = azuread_service_principal.sp_opentelemetry.object_id
}