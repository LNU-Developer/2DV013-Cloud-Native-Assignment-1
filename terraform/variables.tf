# Initial vars
variable "subnetwork_cidr" {
  type    = string
  default = "192.168.4.0/24"
}

variable "key_name" {
  type    = string
  default = "mykey"
}

variable "identity_file" {
  type    = string
  default = "../rm222jx_key_ssh.pem"
}

variable "flavor_id" {
  type    = string
  default = "c1-r1-d10"
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
  default = "https://cscloud.lnu.se:5000"
}

variable "region" {
  type    = string
  default = "RegionOne"
}

# Network vars
variable "network_id" {
  type    = string
  default = "fd401e50-9484-4883-9672-a2814089528c"
}

# IP vars
variable "pool" {
  type    = string
  default = "public"
}

# Instance vars
variable "availability_zone" {
  type    = string
  default = "Education"
}

variable "image_name" {
  type    = string
  default = "Ubuntu server 20.04"
}
