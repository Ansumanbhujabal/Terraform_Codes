# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "web" {
  image = docker_image.nginx.image_id
  name  = "web"
}
