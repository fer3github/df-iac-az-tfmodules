
variable "name" {
  description = "Nombre del perfil del CDN"
}
variable "location" {
  description = "Ubicación donde va a estar el CDN"
}
variable "resource_group_name" {
  description = "RG donde se va a montar el CDN"
}
variable "sku" {
  description = "el SKU del CDN"
}
variable "tags" {
  description = "Tags para aplicar al CDN"
}