variable "project" {
    type = string
    default = "test"
}

variable "region" {
    type = string
    default = "us-central1"
}

variable "zone" {
    type = string
    default = "us-central1-a"
}

variable "name" {
    type = string
    default = "vm-demo"
}

variable "type_machine" {
    type = string
    default = "e2-standard-4"
}

variable "image" {
    type = string
    default = "debian-cloud/debian-10"
}

variable "name_fw" {
    type = string
    default = "demo-firewall"
}

variable "ports" {
    type = list
    default = ["8080", "22", "80"]
}

variable "ssh_pub_key_file" {
    type = string
    default = "key/demo_key.pub"
}

variable "ssh_user" {
    type = string
    default = "lcs10"
}
