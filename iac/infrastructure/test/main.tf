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

resource "dna_site" "building_10" {
  provider = dnacenter
  depends_on = [ dna_site.area ]
  item {
    type = "building"
    name = "Building_10"
    parent_name = dna_site.area.id
    address = "Cisco - Gothenburg, Lilla Bommen 1, Gothenburg, Sweden"
  }
}
resource "dna_site" "building_10_floor1" {
  provider = dnacenter
  depends_on = [ dna_site.building_10 ]
  item {
    type = "floor"
    name = "Floor 1"
    parent_name = dna_site.building_10.id
    rf_model = "Cubes And Walled Offices"
    height = 100
    length = 100
    width = 100
  }
}