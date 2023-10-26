provider "google" {
    credentials = file("test.json")
    project     = var.project
    region      = var.region
}
