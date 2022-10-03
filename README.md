# 2DV013-Cloud-Native-Assignment-1

## Configuration settings
In order for terraform to access the cloud provider a set of steps must be taken which is
The below variables will need to be set in a seperate terraform file before being able to run the application
### Initial vars
- variable "subnetwork_cidr" {
  type    = string
  default = "x.x.x.x/24"
}
  - Example value: 192.168.4.0/24

- variable "key_name" {
  type    = string
  default = "xyz"
}
  - Example value: mysupersecretkey

- variable "identity_file" {
  type    = string
  default = "xyz"
}
  - Example value: ../rm222jx_key_ssh.pem

- variable "flavor_id" {
  type    = string
  default = "xyz"
}
  - Example value: c1-r1-d10
### Provider vars
- variable "user_name" {
  type    = string
  default = "xyz"
}
  - Example value: notgonnagiveanexample

- variable "tenant_name" {
  type    = string
  default = "xyz"
}
  - Example value: notgonnagiveanexample

- variable "password" {
  type    = string
  default = "xyz"
}
  - Example value: notgonnagiveanexample

- variable "auth_url" {
  type    = string
  default = "xyz"
}
  - Example value: https://cscloud.lnu.se:5000

- variable "region" {
  type    = string
  default = "xyz"
}
  - Example value: RegionOne
### Network vars
- variable "network_id" {
  type    = string
  default = "xyz"
}
  - Example value: xxxxxx-xxxx-xxxx-xxxx-xxxxxx
### IP vars
- variable "pool" {
  type    = string
  default = "xyz"
}
  - Example value: public
### Instance vars
- variable "availability_zone" {
  type    = string
  default = "xyz"
}
  - Example value: Education
- variable "image_name" {
  type    = string
  default = "xyz"
}
  - Example value: Ubuntu server 20.04

## Create environments
In order create the environment the following steps needs to be taken
1. Navigate to the repository and the terraform folder
2. Create a new terraform file containing the above variables
3. Navigate to the root folder in the repository
4. Run the command ``bash deploy.sh``
5. Watch magic happen

## Destroy the environments
1. Navigate to the terraform folder in the repository
2. Run the command ``terraform destroy``
3. Watch magic happen