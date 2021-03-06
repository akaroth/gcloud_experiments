module "network" {
  source = "git::https://github.com/FairwindsOps/terraform-gcp-vpc-native.git//default?ref=default-v2.1.0"
  // base network parameters
  network_name     = "gke-vpc"
  subnetwork_name  = "gke-subnet"
  region           = "us-central1"
  enable_flow_logs = "false"
  // subnetwork primary and secondary CIDRS for IP aliasing
  subnetwork_range    = "10.40.0.0/16"
  subnetwork_pods     = "10.41.0.0/16"
  subnetwork_services = "10.42.0.0/16"
}