output "all_ipv4" {
  value = "${module.zkcs1.zkcs_ipv4},${module.postgre1.postgre_ipv4},${module.rmp1.rmp_ipv4}"
}

output "all_instance_id" {
  value = "${module.zkcs1.zkcs_instance_id},${module.postgre1.postgre_instance_id},${module.rmp1.rmp_instance_id}"
}

output "all_serverType" {
  value = "${module.zkcs1.zkcs_serverType},${module.postgre1.postgre_serverType},${module.rmp1.rmp_serverType}"
}

output "all_serverName" {
  value = "${module.zkcs1.zkcs_serverName},${module.postgre1.postgre_serverName},${module.rmp1.rmp_serverName}"
}

output "all_az" {
  value = "${module.zkcs1.zkcs_az},${module.postgre1.postgre_az},${module.rmp1.rmp_az}"
}

output "3NodeOp" {
  value = "${module.zkcs1.zkcs_ipv4},${module.postgre1.postgre_ipv4},${module.rmp1.rmp_ipv4}"
}
