# TF_AKS_OTEL
Creta an AKS cluster for OTEL in Terraform with modules for Service Principal and Key Vaults 

1. Create a Resourse Group
2. Create a Module for the Service Principal
3. Create a Role Assigment for the Service Principal. "Key Vault Secret Officer" role
4. Give your subscription the same Key Vault Secret Officer" role, in this way, your subscription will be able to create a secret because it will have the enough Data Action privilege (It refers to the actions inside the resource. Just "Action" refers to the priviliage to manage the resource overall, but not the things inside the resource)
5. Create a Module for the Key Vault to store the Service Principals' Secret
6. Create the resource "Key Vault Secret witch is the Service Principals' Secret stored in the Key Vault"
