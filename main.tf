provider "azurerm" {
    subscription_id=var.sp_subscription_id
    client_id = var.sp_client_id
    client_secret = var.sp_client_secret
    tenant_id = var.sp_tenant_id
    
    features{}
}
module "k8ss" {
    source =                            "./modules/k8s/"
    host =                              "${var.cluster_host}"
    cluster_ca_certificate =            "${base64decode(var.cluster_ca_certificate)}"
    client_key =                        "${base64decode(var.cluster_client_key)}"
    client_certificate =                "${base64decode(var.cluster_client_certificate)}"
}