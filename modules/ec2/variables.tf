variable "ec2_config" {
  description = "Configuración detallada de las instancias EC2 (AMI, tipo, discos, etc.)"
  type = map(object({
    role_name         = string
    ami               = string
    instance_type     = string
    subnet_id         = string
    tagsec2           = map(string)
    policy_arn        = string
    policy_arn1       = string
    root_block_device = object({
      volume_size = number
      volume_type = string
      iops        = number
    })
  }))
}

variable "tags" {
  description = "Etiquetas generales aplicables a todos los recursos"
  type        = map(string)
}

variable "security_group_ids" {
  description = "Mapa de IDs de Security Groups que vienen del módulo de seguridad"
  type        = map(string)
}

variable "iam_instance_profiles" {
  description = "Mapa de perfiles de IAM que vienen del módulo IAM"
  type        = map(string)
}

variable "key_name" {
  description = "Nombre que se le asignará al Key Pair en AWS"
  type        = string
}

variable "private_key_path" {
  description = "Ruta donde se guardará el archivo .pem localmente"
  type        = string
}