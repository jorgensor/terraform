terraform {
  required_providers {
    dnacenter = {
      source = "cisco-en-programmability/dnacenter"
      version = "0.0.3"
    }
  }
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
provider "dnacenter" {
  username = var.username
  password = var.password
  base_url = "https://dnac.gotlab.net.tld"
}