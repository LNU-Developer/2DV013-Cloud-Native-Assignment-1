# Initial vars
variable "subnetwork_cidr" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}

variable "identity_file" {
  type    = string
  default = ""
}

variable "flavor_id" {
  type    = string
  default = ""
}

#Provider vars
variable "user_name" {
  type    = string
  default = ""
}

variable "tenant_name" {
  type    = string
  default = ""
}

variable "password" {
  type    = string
  default = ""
}

variable "auth_url" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

# Network vars
variable "network_id" {
  type    = string
  default = ""
}

# IP vars
variable "pool" {
  type    = string
  default = ""
}

# Instance vars
variable "availability_zone" {
  type    = string
  default = ""
}

variable "image_name" {
  type    = string
  default = ""
}
