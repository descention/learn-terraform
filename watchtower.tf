resource "docker_container" "watchtower" { 
    name = "watchtower"
    image = docker_image.watchtower.latest
    env = [ 
        "WATCHTOWER_CLEANUP=true",
        "WATCHTOWER_ROLLING_RESTART=true"
     ]
     network_mode      = "bridge"

     mounts {
      source = "/var/run/docker.sock"
      target = "/var/run/docker.sock"
      type = "bind"
    }
}

resource "docker_image" "watchtower" {
    name = "containrrr/watchtower:latest"
    keep_locally = false
}