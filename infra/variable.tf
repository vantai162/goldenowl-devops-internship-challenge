variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "project_name" {
  type    = string
  default = "goldenowl"
}

variable "docker_image" {
  description = "Docker image repository name"
  type        = string
  default     = "vantai162/goldenowl-app"
}

variable "github_repo" {
  description = "GitHub repository formatted as owner/repository"
  type        = string
  default     = "vantai162/goldenowl-devops-internship-challenge"
}

variable "container_port" {
  type    = number
  default = 3000
}