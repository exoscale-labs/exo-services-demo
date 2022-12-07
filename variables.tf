/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

variable "zone" {
  type    = string
  default = "de-fra-1"
}

variable "labels" {
  type = map

  default = {
    project = "exo-services"
    environment = "demo"
  }
}

variable "sks_version" {
  type    = string
  default = "1.25.4"
}

variable "sks_user" {
  type    = string
  default = "kub-adm"
}

variable "prefix" {
  type    = string
  default = "sh"
}

variable "instance_type" {
  type    = string
  default = "standard.large"
}

variable "np_size" {
  description = "Number of nodes"
  type        = number
  default     = 2
}

variable "disk_size" {
  type        = number
  default     = 30
}

variable "ssh_key" {
  type    = string
  default = "ssh-key"
}



