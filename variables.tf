/*
This file contains all the variables defined for the terraform code
Refer to terraform-{env}.tfvars for the actual value for these variables
*/

# Variables for Azure resource group
variable "resource_group_name" {
  type        = string
  description = "Configure the resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "Configure the resource group location"
}

variable "environment" {
  type        = string
  description = "Configure the name for environment"
}

# Variables for Kubernetes Cluster
variable "cluster_name" {
  type        = string
  description = "Configure the name of the Managed Kubernetes Cluster to create"
  default     = ""
}

variable "dns_prefix" {
  type        = string
  description = "Configure DNS prefix specified when creating the managed cluster"
  default     = "aks-dns"
}

variable "k8s_version" {
  type        = string
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)"
}

# Variables for Node pool
variable "node_pool_name" {
  type        = string
  description = "Configure the name which should be used for the default Kubernetes Node Pool"
  default     = "default"
}

variable "node_pool_count" {
  type        = number
  description = "Configure the initial number of nodes which should exist in this Node Pool (1 - 1000)"
  default     = 1
}

variable "node_pool_vm_size" {
  type        = string
  description = "Configure the size of the Virtual Machine"
  default     = "Standard_DS2_v2"
}

variable "node_pool_max_count" {
  type        = string
  description = "Configure the maximum number of nodes which should exist in this Node Pool (1 - 1000)"
  default     = "1"
}

variable "node_pool_min_count" {
  type        = string
  description = "Configure the minimum number of nodes which should exist in this Node Pool (1 - 1000)"
  default     = "1"
}

variable "k8s_type" {
  type        = string
  description = "Configure the type of Node Pool which should be created" # AvailabilitySet, VirtualMachineScaleSets
  default     = "VirtualMachineScaleSets"
}

variable "node_pool_osdisk_size" {
  type        = number
  description = "Configure the size of the OS Disk which should be used for each agent in the Node Pool"
  default     = "50"
}

variable "enable_auto_scaling" {
  type        = string
  description = "Configure whether Kubernetes Auto Scaler should be enabled for this Node Pool"
  default     = "false"
}

# Variables for Service Principal and Tenant
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "client_id" {
  type        = string
  description = "Azure App Registration Application (client) ID"
}

variable "client_secret" {
  type        = string
  description = "Azure App Registration Application secret"
}

variable "tenant_id" {
  type        = string
  description = "Azure App Registration Application Direcotry (tenant) ID"
}

# Variables for Network Profile
variable "network_plugin" {
  type        = string
  description = "Configure K8s network plugin to use for networking"
  default     = "kubenet"
}

variable "load_balancer_sku" {
  type        = string
  description = "Specifiey the SKU of the Load Balancer used for this Kubernetes Cluster"
  default     = "Standard"
}

# Variables for ACR and the Management Lock
variable "acr_name" {
  type        = string
  description = "Specify the name of the Container Registry"
  default     = ""
}

variable "acr_sku" {
  type        = string
  description = "Specify the SKU name of the container registry" # Basic, Standard, Permium
  default     = "Basic"
}

variable "acr_admin_enabled" {
  type        = string
  description = "Specify whether the admin user is enabled"
  default     = "False"
}

# Variables for Management Lock
variable "acr_lock_name" {
  type        = string
  description = "Specify that lock name"
  default     = "Prevent Delete"
}

variable "acr_lock_level" {
  type        = string
  description = "Configure the type of lock"
  default     = "CanNotDelete"
}

variable "acr_lock_notes" {
  type        = string
  description = "Configure the management lock note"
  default     = "Lock to disable deleting"
}

# Variables for Azure Database for PostgreSQL servers
variable "sql_name" {
  type        = string
  description = "PostgreSQL Server Name"
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "PostgreSQL SKU Name"
  default     = "B_Gen5_1" # Basic Gen5
}

variable "storage_mb" {
  type        = string
  description = "PostgreSQL Storage in MB"
  default     = "5120"
}

variable "geo_redundant_backup_enabled" {
  type        = string
  description = "Configure geo redundant backups"
  default     = "false"
}

variable "auto_grow_enabled" {
  type        = string
  description = "Configure database to auto grow"
  default     = "true"
}

variable "backup_retention_days" {
  type        = number
  description = "Configure backup retention days"
  default     = 1
}

variable "admin_login" {
  type        = string
  description = "Login to authenticate to PostgreSQL Server"
}

variable "administrator_login_password" {
  type        = string
  description = "Password to authenticate to PostgreSQL Server"
}

variable "server_version" {
  type        = string
  description = "PostgreSQL Server version to deploy"
  default     = "11"
}

variable "ssl_enforcement_enabled" {
  type        = string
  description = "Configure enforcement of TLS connections"
  default     = "true"
}

variable "ssl_minimal_tls_version_enforced" {
  type        = string
  description = "Configure minimum TLS version enforce"
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  type        = string
  description = "Configure public network access"
  default     = "true"
}

variable "sql_db_name" {
  type        = string
  description = "PostgreSQL database name"
  default     = ""
}

variable "db_charset" {
  type        = string
  description = "Configure database character set"
  default     = "UTF8"
}

variable "db_collation" {
  type        = string
  description = "Configure database collation"
  default     = "English_United States.1252"
}

# Variables for deploying Windows and Linux VMs, VNets, subnets, NSGs, Public IPs

variable "infra_resource_group_name" {
  type        = string
  description = "Configure the resource group name that will contain the VMs and network components"
  default     = ""
}

variable "linux_vm_os_simple" {
  type        = string
  description = "Configure Linux operating system"
  default     = ""
}

variable "linux_public_ip_dns" {
  type        = string
  description = "Configure Linux public IP DNS name label"
  default     = ""
}

variable "linux_enable_ssh_key" {
  type        = string
  description = "Configure"
  default     = "Configure whether Linux SSH key autentication is enabled"
}

variable "linux_admin_username" {
  type        = string
  description = "Configure username for Linux VM"
  default     = ""
}

variable "linux_admin_password" {
  type        = string
  description = "Configure password for Linux VM"
  default     = ""
}

variable "windows_is_windows_image" {
  type        = string
  description = "Configure whether a Windows image is used"
  default     = "true"
}

variable "windows_vm_hostname" {
  type        = string
  description = "Configure hostname to use for Windows VM"
  default     = ""
}

variable "windows_admin_password" {
  type        = string
  description = "Configure administrator password for Windows VM"
  default     = ""
}

variable "windows_vm_os_simple" {
  type        = string
  description = "Configure Windows image to use for VM"
  default     = "WindowsServer"
}

variable "windows_public_ip_dns" {
  type        = string
  description = "Configure Windows public IP DNS name label"
  default     = ""
}

variable "address_space_0" {
  type        = string
  description = "Configure VNet address space"
  default     = ""
}

variable "address_space_1" {
  type        = string
  description = "Configure additional VNet address space"
  default     = ""
}

variable "subnet_prefixes_0" {
  type        = string
  description = "Configure subnet name"
  default     = ""
}

variable "subnet_prefixes_1" {
  type        = string
  description = "Configure additional subnet"
  default     = ""
}

variable "subnet_prefixes_2" {
  type        = string
  description = "Configure additional subnet"
  default     = ""
}

variable "subnet_names_0" {
  type        = string
  description = "Configure subnet name"
  default     = ""
}

variable "subnet_names_1" {
  type        = string
  description = "Configure additional subnet name"
  default     = ""
}

variable "subnet_names_2" {
  type        = string
  description = "Configure additional subnet name"
  default     = ""
}

variable "service_endpoint_1" {
  type        = string
  description = "Configure service endpoint services"
  default     = ""
}