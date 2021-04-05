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
variable "base_url" {
  type = string
}

provider "dnacenter" {
  username = var.username
  password = var.password
  base_url = var.base_url
  ssl_verify = "false"
}

resource "dna_site" "area" {
  provider = dnacenter
    item {
      type = "area"
      name = "TestArea1"
      parent_name = "Global"
  }
}
