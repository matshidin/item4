variable "location" {
  type    = string
  default = "eastasia"
}
variable "prefix" {
  type    = string
  default = "final-assignmentitem4"
}

variable "ssh-source-address" {
  type    = string
  default = "*"
}

variable "username" {
  default     = "adminuser"
  description = "Admin username for all VMs"
}

variable "password" {
  default     = "Bismillah95%"
  description = "Admin password for all VMs"
}

#variable "client_id" {
#  type = string
#}
#
#variable "client_secret" {
#  type = string
#}
#
#variable "subscription_id" {
#  type = string
#}
#
#variable "tenant_id" {
#  type = string
#}
