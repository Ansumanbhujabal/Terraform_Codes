# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "web" {
  image = docker_image.nginx.image_id
  name  = "web"
 ports {
    internal = 80
    external = 8080
    ip       = "0.0.0.0"
  }
}
