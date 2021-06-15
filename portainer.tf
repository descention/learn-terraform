resource "docker_container" "portainer" {
    image             = docker_image.portainer.latest

    name              = "portainer"
    restart           = "always"
    ports {
        external = 8000
        internal = 8000
        ip = "0.0.0.0"
        protocol = "tcp"
    }
    ports {
        external = 9000
        internal = 9000
        ip = "0.0.0.0"
        protocol = "tcp"
    }

    mounts {
      source = "/var/run/docker.sock"
      target = "/var/run/docker.sock"
      type = "bind"
    }

    volumes {
      container_path = "/data"
      host_path = docker_volume.portainer.mountpoint
    }
}

resource "docker_image" "portainer" {
    name = "portainer/portainer:latest"
    keep_locally = false
}

resource "docker_volume" "portainer" {
    name = "portainer_data"
}