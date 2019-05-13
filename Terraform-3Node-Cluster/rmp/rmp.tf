resource "openstack_blockstorage_volume_v2" "rmpvol" {
  name              = "${var.instance_name}_RMP_${var.az}"
  size              = "${var.rmp_size}"
  availability_zone = "${var.az}"
}

resource "openstack_compute_instance_v2" "rmp" {
  name              = "${var.instance_name}_RMP_${var.az}"
  image_id          = "${var.image_id}"
  flavor_id         = "${var.rmp_flavor_is}"
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
    serverType      = "RM"
    name            = "${var.instance_name}_RMP_${var.az}"
    createdBy       = "${var.user}"
    teamMaintaining = "${var.team_maintaining}"
    volumeSdb       = "${var.rmp_size}"
    serverFlavor    = "${var.rmp_flavor_is}"
  }
}

resource "openstack_compute_volume_attach_v2" "rmp_attach" {
  volume_id   = "${openstack_blockstorage_volume_v2.rmpvol.id}"
  instance_id = "${openstack_compute_instance_v2.rmp.id}"
}

output "rmp_ipv4" {
  value = "${join(",",openstack_compute_instance_v2.rmp.*.access_ip_v4)}"
}

# Use `terraform output web_instance_id` to retrieve the value
output "rmp_instance_id" {
  value = "${join(",",openstack_compute_instance_v2.rmp.*.id)}"
}

output "rmp_serverType" {
  value = "${join(",",openstack_compute_instance_v2.rmp.*.metadata.serverType)}"
}

output "rmp_serverName" {
  value = "${join(",",openstack_compute_instance_v2.rmp.*.name)}"
}

output "rmp_az" {
  value = "${join(",",openstack_compute_instance_v2.rmp.*.availability_zone)}"
}
