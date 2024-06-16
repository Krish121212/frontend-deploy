variable "project_name" {
  default = "expense"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = "true"
    Component = "frontend"
  }
}

variable "zone_name" {
  default = "devopskk.online"
}

# created this as a part of jenkins CD
variable "app_version" {
  
}