variable "array" {
  type    = list(string)
  default = ["adithya", "adith", "adi","Ram","ms","sr"]
}


# Output individual elements
output "first_element" {
  value = var.array[0]
}

output "second_element" {
  value = var.array[1]
}

output "third_element" {
  value = var.array[2]
}
output "Is_all_the_elements_same" {
  value = var.array[0] == var.array[1] == var.array[2] ? "Yes" : "No"
  
}

output "all_elements" {
    value = "${join(" , ", var.array)}"
  
}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  alias = "kreuzwerker"
}

resource "docker_container" "ex_container" {
  provider = docker.kreuzwerker
  image    = "nginx:latest"
  name     = "array_container"
 ports {
    internal = 80
    external = 8080
  }

}

