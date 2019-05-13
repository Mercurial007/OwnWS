resource "openstack_blockstorage_volume_v2" "zkcsvol" {
  name              = "${var.instance_name}_ZKCS_${var.az}"
  size              = "${var.zkcs_size}"
  availability_zone = "${var.az}"
}

resource "openstack_compute_instance_v2" "zkcs" {
  name              = "${var.instance_name}_ZKCS_${var.az}"
  image_id          = "${var.image_id}"
  flavor_id         = "${var.zkcs_flavor_is}"
  key_pair          = "${var.key}"
  security_groups   = ["${var.security_group}"]
  user_data         = "${file("cloud-config.yaml")}"
  availability_zone = "${var.az}"

  network {
    name           = "${var.network_name}"
    uuid           = "${var.network}"
    access_network = true
  }

  metadata = {
    serverType      = "DS"
    name            = "${var.instance_name}_ZKCS_${var.az}"
    createdBy       = "${var.user}"
    teamMaintaining = "${var.team_maintaining}"
    volumeSdb       = "${var.zkcs_size}"
    serverFlavor    = "${var.zkcs_flavor_is}"
  }
}

resource "openstack_compute_volume_attach_v2" "zkcs_attach" {
  volume_id   = "${openstack_blockstorage_volume_v2.zkcsvol.id}"
  instance_id = "${openstack_compute_instance_v2.zkcs.id}"
}

output "zkcs_ipv4" {
  value = "${join(",",openstack_compute_instance_v2.zkcs.*.access_ip_v4)}"
}

# Use `terraform output web_instance_id` to retrieve the value
output "zkcs_instance_id" {
  value = "${join(",",openstack_compute_instance_v2.zkcs.*.id)}"
}

output "zkcs_serverType" {
  value = "${join(",",openstack_compute_instance_v2.zkcs.*.metadata.serverType)}"
}

output "zkcs_serverName" {
  value = "${join(",",openstack_compute_instance_v2.zkcs.*.name)}"
}

output "zkcs_az" {
  value = "${join(",",openstack_compute_instance_v2.zkcs.*.availability_zone)}"
}
