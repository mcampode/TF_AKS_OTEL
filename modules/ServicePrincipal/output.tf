output "service_principal_name" {
  description = "Nombre del Service Principal"
  value       = azuread_service_principal.sp_opentelemetry.display_name
}

output "service_principal_object_id" {
  description = "The object id of the service principal. Can be used to assign roles"
  value       = azuread_service_principal.sp_opentelemetry.object_id
}

output "service_principal_tenant_id" {
  value = azuread_service_principal.sp_opentelemetry.application_tenant_id
}

output "service_principal_application_id" {
  description = "The object id of the service principal. Can be used to assign roles"
  value       = azuread_service_principal.sp_opentelemetry.application_id
}

output "client_id" {
  description = "The application id of the AzureAD application created"
  value       = azuread_application.app_opentelemetry.application_id
}

output "client_secret" {
  description = "Password for Service Principal"
  value       = azuread_service_principal_password.sp_password.value
}

