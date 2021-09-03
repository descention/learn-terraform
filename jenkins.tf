resource "docker_image" "jenkins" {
    name = "jenkins/jenkins:lts-jdk11"
    keep_locally = false
}

resource "docker_container" "jenkins" {
    name = "jenkins"
    image = docker_image.jenkins.latest

    env = [
        "JAVA_OPTS=-Djenkins.install.runSetupWizard=false",
        "CASC_JENKINS_CONFIG=/var/jenkins_home/casc.yaml"
    ]

    ports{
        internal = 8080
        external = 8080
    }
}

