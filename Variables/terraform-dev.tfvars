/*
This file contains all the values for the variables defined in variables.tf
*/

# Variable values for Azure resource group
resource_group_name     = "ca-cn-dev-demo-rg" # This can also be stored in GitHub secrets
resource_group_location = "canadacentral"     # This can also be stored in GitHub secrets
environment             = "dev"               # This can also be stored in GitHub secrets

# Variable values for Kubernetes Cluster and Pool
cluster_name        = "ca-cn-dev-aks"
dns_prefix          = "aks-dns"
k8s_version         = "1.22.6"
node_pool_name      = "default"
node_pool_count     = 2
node_pool_vm_size   = "standard_b2ms"
node_pool_max_count = 5
node_pool_min_count = 1

k8s_type              = "VirtualMachineScaleSets" #Default is VirtualMachineScaleSets
node_pool_osdisk_size = 50
enable_auto_scaling   = false

# Variable values for Network Profile
network_plugin    = "kubenet"
load_balancer_sku = "Standard"

# Variable values for container registry and management lock - Super Linter would fail if a management lock is not created
acr_name = "akscontainersreg"
acr_sku = "Basic"
acr_admin_enabled = "true"
acr_lock_name = "Prevent Delete"
acr_lock_level = "CanNotDelete"
acr_lock_notes = "Prevent accidental deletion"

# Variable values for Azure Database for PostgreSQL servers
sql_name = "ca-cn-dev-psql01" # This can also be stored in GitHub secrets

sku_name       = "GP_Gen5_2"
server_version = "11"
storage_mb     = 5120

# Expected backup_retention_days to be in the range (7 - 35)
backup_retention_days        = 7
geo_redundant_backup_enabled = true # note that basic tier does not support this
auto_grow_enabled            = true

public_network_access_enabled    = true
ssl_enforcement_enabled          = true
ssl_minimal_tls_version_enforced = "TLS1_2"

sql_db_name  = "Test-dev-DB"
db_charset   = "UTF8"
db_collation = "English_United States.1252"

# Variables for resources to deploy virtual machine
# Resources include Resource Group, Linux VM, Windows VM, VNet, Public IP

# Resource Group variables
infra_resource_group_name     = "ca-cn-dev-demo-infra-rg"

# Linux VM variables
linux_vm_os_simple            = "UbuntuServer"
linux_public_ip_dns           = "linsimplevmips-pip"
linux_enable_ssh_key          = "false"
linux_admin_username          = "admin_testing123"
linux_admin_password          = "88##22MMnnDDee@@!!"

# Windows VM variables
windows_is_windows_image      = true
windows_vm_hostname           = "Windows-VM"
windows_admin_password        = "88##22MMnnDDee@@!!"
windows_vm_os_simple          = "WindowsServer"
windows_public_ip_dns         = "winsimplevmips-pip"

# Network variables
address_space_0               = "10.0.0.0/16"
address_space_1               = "10.2.0.0/16"
subnet_prefixes_0             = "10.0.1.0/24"
subnet_prefixes_1             = "10.0.2.0/24"
subnet_prefixes_2             = "10.0.3.0/24"
subnet_names_0                = "snet-us-eus-svr-10.0.1.0-24"
subnet_names_1                = "snet-us-eus-svr-10.0.2.0-24"
subnet_names_2                = "snet-us-eus-svr-10.0.3.0-24"
service_endpoint_1            = "Microsoft.Sql"