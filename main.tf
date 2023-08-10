# Architecture for OpenTelemetry

data "azurerm_subscription" "primary" {
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.rg_name
}

# Creacion del Service Principal
module "ServicePrincipal" {
  source  = "./modules/ServicePrincipal"
  sp_name = var.sp_name

  depends_on = [azurerm_resource_group.rg]
}


resource "azurerm_role_assignment" "role_sp" {
  scope = module.keyvault_otel.kv_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id = module.ServicePrincipal.service_principal_object_id # Service Principal ID (Object ID)
}

module "keyvault_otel" {
  source        = "./modules/keyvault_otel"
  keyvault_name = var.keyvault_name
  location      = var.location
  rg_name       = var.rg_name

  depends_on = [module.ServicePrincipal]
}

resource "azurerm_key_vault_secret" "kv_secret" {
  name         = module.ServicePrincipal.client_id
  value        = module.ServicePrincipal.client_secret
  key_vault_id = module.keyvault_otel.kv_id
  
  depends_on   = [azurerm_role_assignment.role_sp]
}
