module "cluster" {
  source                           = "git::https://github.com/FairwindsOps/terraform-gke.git//vpc-native?ref=vpc-native-v1.2.0"
  region                           = "us-central1"
  name                             = "gke-test"
  project                          = "terraform-module-cluster"
  network_name                     = "gke-vpc"
  nodes_subnetwork_name            = module.network.subnetwork
  kubernetes_version               = "1.19.9-gke.1900"
  pods_secondary_ip_range_name     = module.network.gke_pods_1
  services_secondary_ip_range_name = module.network.gke_services_1
}

module "node_pool" {
  source             = "git::https://github.com/FairwindsOps/terraform-gke.git//node_pool?ref=node-pool-v3.0.0"
  name               = "worker-node-gke"
  region             = module.cluster.region
  gke_cluster_name   = module.cluster.name
  machine_type       = "n1-standard-2"
  min_node_count     = "1"
  max_node_count     = "2"
  kubernetes_version = module.cluster.kubernetes_version
}