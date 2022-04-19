/*
This file contains all the variables defined for the terraform code
*/

# Variables for Kubernetes Cluster
variable "cluster_name" {}
variable "resource_group_location" {}
variable "resource_group_name" {}
variable "dns_prefix" {}

variable "k8s_version" {}

# Variables for Node pool
variable "node_pool_name" {}
variable "node_pool_count" {}
variable "node_pool_vm_size" {}
variable "node_pool_max_count" {}
variable "node_pool_min_count" {}

variable "k8s_type" {}
variable "node_pool_osdisk_size" {}
variable "enable_auto_scaling" {}

# Variables for Service Principal
variable "client_id" {}
variable "client_secret" {}

# Variables for Network Profile
variable "network_plugin" {}
variable "load_balancer_sku" {}

# Variable for Tags
variable "env" {}