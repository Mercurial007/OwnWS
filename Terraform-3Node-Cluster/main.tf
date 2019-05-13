provider "openstack" {
user_name  = "${var.user}"
password  = "${var.password}"
tenant_id = "${var.tenantId}"
auth_url  = "${var.authUrl}"
#domain_id = "${var.domainId}"
#domain_name="${var.domainName}"
}
