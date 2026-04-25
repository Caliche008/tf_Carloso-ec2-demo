variable "sg_config" {
  description = "Configuracion de los Security Groups (Ingress rules)"
  type        = any
}

variable "proyecto" {
  description = "Nombre del proyecto para el etiquetado"
  type        = string
}

variable "cuenta" {
  description = "Numero de cuenta de AWS para el etiquetado"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se crearan los grupos de seguridad"
  type        = string
}