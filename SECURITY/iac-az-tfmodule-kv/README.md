# Introducción

Este código Terraform es para crear un recurso de Azure Key Vault en Azure. Utiliza el proveedor "azurerm" versión 3.0 y está escrito en el lenguaje de configuración Terraform. Se incluye además la creación de un private endpoint para el Key Vault que permite conectarse a éste de manera segura y privada desde una subred específica de Azure Virtual Network.

# Requisitos Previos

Antes de usar este código, debe tener los siguientes elementos:

- Una suscripción de Azure
- Un grupo de recursos de Azure
- Una red y una subred definida en Azure para administrar los private endpoints

# Build and Test

Para ejecutar esta plantilla se debe incluir este módulo en un módulo principal. Se detallará en el módulo de core como integrar submódulos.

Posteriormente se hará uso de los comandos de terraform para el despliegue

```
terraform init
terraform plan
terraform apply
```

# Recursos

El código crea los siguientes recursos de Azure:

- azurerm_key_vault: Este recurso crea un Key Vault en Azure.
- azurerm_private_endpoint: Este recurso crea un Private Endpoint para el Key Vault.

# Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

- resource_group_name: Es el nombre del Resource Group en el que se creará el Key Vault.

- resource_group_location: Es la ubicación del Resource Group en la que se creará el Key Vault.

- kvname: es una cadena que representa el nombre del Key Vault.

- allowed_ip_ranges (opcional): Es una lista de intervalos de direcciones IP en formato CIDR para permitir el acceso a el Key Vault. Si no se especifica, el valor por defecto es una lista vacía.

- permitted_virtual_network_subnet_ids (opcional): Es una lista de los IDs de subred para permitir el acceso al Key Vault. Si no se especifica, el valor por defecto es una lista vacía.

- sku_name: es una cadena que representa el nombre del SKU utilizado para este Key Vault. Puede ser "standard" o "premium".

- enabled_for_deployment: es una variable booleana que indica si el Key Vault está habilitado para su uso en la implementación.

- enabled_for_disk_encryption: es una variable booleana que indica si el Key Vault está habilitado para su uso en el cifrado de disco.

- enabled_for_template_deployment: es una variable booleana que indica si el Key Vault está habilitado para su uso en las implementaciones de plantillas ARM.

# Ejemplo de uso

Ejemplo de uso, llamada desde el módulo principal

```
module "kv-devops" {
  source                  = "../modules/iac-z-tfmod-azurerm-kv/"
  kvname                  = "kvtestib"
  resource_group_name     = azurerm_resource_group.main.name
  resource_group_location = azurerm_resource_group.main.location
}
```
