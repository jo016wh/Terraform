terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = 1
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = 1
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}


 output "IP-address" {
 value       = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address])]
 description = "the IP address of the container"

 }

output "container_name" {
  value       = docker_container.nodered_container[*].name
  description = "the name of the container"
}