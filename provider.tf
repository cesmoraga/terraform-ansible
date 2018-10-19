# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("gausscontrol-219614-a8d5cd61dc33.json")}"
project = "gausscontrol-219614"
region = "southamerica-east1-b"
}
