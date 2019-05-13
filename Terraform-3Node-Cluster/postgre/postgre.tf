resource "openstack_blockstorage_volume_v2" "postgrevol" {
  name              = "${var.instance_name}_POSTGRES_${var.az}"
  size              = "${var.postgre_size}"
  availability_zone = "${var.az}"
}

resource "openstack_compute_instance_v2" "postgre" {
  name              = "${var.instance_name}_POSTGRES_${var.az}"
  image_id          = "${var.image_id}"
  flavor_id         = "${var.postgre_flavor_is}"
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
    serverType      = "PG"
    name            = "${var.instance_name}_POSTGRES_${var.az}"
    createdBy       = "${var.user}"
    teamMaintaining = "${var.team_maintaining}"
    volumeSdb       = "${var.postgre_size}"
    serverFlavor    = "${var.postgre_flavor_is}"
  }
}

resource "openstack_compute_volume_attach_v2" "postgre_attach" {
  volume_id   = "${openstack_blockstorage_volume_v2.postgrevol.id}"
  instance_id = "${openstack_compute_instance_v2.postgre.id}"
}

output "postgre_ipv4" {
  value = "${join(",",openstack_compute_instance_v2.postgre.*.access_ip_v4)}"
}

# Use `terraform output web_instance_id` to retrieve the value
output "postgre_instance_id" {
  value = "${join(",",openstack_compute_instance_v2.postgre.*.id)}"
}

output "postgre_serverType" {
  value = "${join(",",openstack_compute_instance_v2.postgre.*.metadata.serverType)}"
}

output "postgre_serverName" {
  value = "${join(",",openstack_compute_instance_v2.postgre.*.name)}"
}

output "postgre_az" {
  value = "${join(",",openstack_compute_instance_v2.postgre.*.availability_zone)}"
}
