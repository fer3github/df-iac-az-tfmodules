variable "name" {
  type = string
}

variable "sql_server_id" {
  type = string
}

variable "start_ip" {
  type        = string
  description = "Ip que queremos que acceda al sql-server"
}

variable "end_ip" {
  type        = string
  description = "Ip que queremos que acceda al sql-server"
}