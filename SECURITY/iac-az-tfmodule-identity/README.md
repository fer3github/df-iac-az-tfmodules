# Introducción

Este código Terraform es para crear un recurso de Azure private DNS zone en Azure. Utiliza el proveedor "azurerm" versión 3.0 y está escrito en el lenguaje de configuración Terraform.

# Requisitos Previos

Antes de usar este código, debe tener los siguientes elementos:

- Una suscripción de Azure
- Un grupo de recursos de Azure

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

- azurerm_private_dns_zone: Este recurso crea una zona DNS privada en Azure.

# Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

- resource_group_name: Es el nombre del Resource Group en el que se creará la zona DNS.

- dnsname: es una cadena que representa el nombre de la zona DNS.

- tags: requeridas por políticas internas

# Ejemplo de uso

Ejemplo de uso, llamada desde el módulo principal

```
module "iac-az-tfmodule-dns" {
  source                  = "git::https://github.com/mahoutest/iac-az-tfmodules.git//iac-az-tfmodule-dns/"
  dnsname                 = "mahoudnsprivatezone"
  resource_group_name     = var.resource_group_name
}
```
