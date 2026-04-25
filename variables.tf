variable "sg_config" {
  type = any
}

variable "proyecto" {
  type = string
}

variable "cuenta" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ec2_config" {
  type = any
}

variable "key_name" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}