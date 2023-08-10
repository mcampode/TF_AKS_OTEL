
data "azurerm_client_config" "current" {}

/*
data "azuread_service_principal" "sp_opentelemetry" {
  display_name = var.sp_name
}
*/

resource "azurerm_key_vault" "kv" {
  name                       = var.keyvault_name
  location                   = var.location
  resource_group_name        = var.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = false
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true # Ya no se necesita especificar "Access policy" con este atributo 
  /*
  access_policy {
    #tenant_id = data.azurerm_client_config.current.tenant_id
    tenant_id = var.sp_tenant_id
    object_id = var.sp_object_id

    key_permissions = [
      "Get", "List", "Create"
    ]

    secret_permissions = [
      "Get", "List", "Set"
    ]
  }*/
}

