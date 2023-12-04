terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "abc" {
  name         = "nginx:1.19.6"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.abc.image_id
  name  = "webserver"
  ports {
    internal = 8080
    external = 8003
  }
}
