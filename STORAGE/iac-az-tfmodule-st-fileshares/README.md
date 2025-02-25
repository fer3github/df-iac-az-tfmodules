# Introducción

Este módulo se encarga de crear un storage account en Azure. Además se incluye el uso de un private endpoint para acceder al storage account desde una red virtual privada que se podrá proveer por parámetro.

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

- azurerm_storage_account: Este recurso crea un Storage Account en Azure.
- azurerm_private_endpoint: Este recurso crea un Private Endpoint para el Key Vault.

# Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

- resource_group_name: Es el nombre del Resource Group en el que se creará la storage account.  Tiene que cumplir con la convencion de nombres.

- resource_group_location: Es la ubicación del Resource Group en la que se creará la storage account.

- storage_account_name: Es el nombre de la storage account que se creará.  Tiene que cumplir con la convencion de nombres.

- storage_account_tier (opcional): Es la categoría de la storage account, que puede ser 'Standard' o 'Premium'. Si no se especifica, el valor por defecto es 'Standard'.

- storage_account_replication_type (opcional): Es el tipo de replicación que se utilizará para esta storage account. Las opciones válidas son LRS, GRS, RAGRS y ZRS. Si no se especifica, el valor por defecto es 'LRS'.

- allowed_ip_ranges (opcional): Es una lista de intervalos de direcciones IP en formato CIDR para permitir el acceso a la storage account. Si no se especifica, el valor por defecto es una lista vacía.

- permitted_virtual_network_subnet_ids (opcional): Es una lista de los IDs de subred para permitir el acceso a la storage account. Si no se especifica, el valor por defecto es una lista vacía.

- bypass_internal_network_rules (opcional): Indica si se permite el tráfico interno para habilitar la recopilación de métricas y registros. Si no se especifica, el valor por defecto es verdadero.

- enable_data_lake_filesystem (opcional): Indica si se creará un sistema de archivos de datalake. Si no se especifica, el valor por defecto es falso.

- data_lake_filesystem_name (opcional): Es el nombre del sistema de archivos de datalake. Si no se especifica, el valor por defecto es una cadena vacía.

- identity_ids (opcional): Es una lista de los IDs de identidad. Si no se especifica, el valor por defecto es una lista vacía.

- pe_subnet_id: representa el identificador de recurso del subred privada del private endpoint.

# Ejemplo de uso

Ejemplo de uso, llamada desde el módulo principal

```
module "sta-devops" {
  source                  = "../modules/iac-z-tfmod-azurerm-st/"
  storage_account_name    = "sttestib"
  resource_group_name     = azurerm_resource_group.main.name
  resource_group_location = azurerm_resource_group.main.location
  pe_subnet_id            = lookup(module.vnet1.vnet_subnets_name_id, "snet-seguridad-pro-weu-001")


}

```
