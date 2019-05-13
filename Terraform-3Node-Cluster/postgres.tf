module "postgre1" {
  source = "./postgre"
  instance_name = "${var.instance_name}"
  region = "${var.region}"
  postgre_size = "${var.postgre_size}"
  image_id = "${var.image_id}"
  postgre_flavor_is = "${var.postgre_flavor_is}"
  security_group = "${var.security_group}"
  az = "${var.az_1}"
  network_name = "${var.network_name}"
  network = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key = "${var.ssh_key}"
  user = "${var.user}"
  key = "${var.key}"
}

module "postgre2" {
  source = "./postgre"
  instance_name = "${var.instance_name}"
  region = "${var.region}"
  postgre_size = "${var.postgre_size}"
  image_id = "${var.image_id}"
  postgre_flavor_is = "${var.postgre_flavor_is}"
  security_group = "${var.security_group}"
  az = "${var.az_2}"
  network_name = "${var.network_name}"
  network = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key = "${var.ssh_key}"
  user = "${var.user}"
  key = "${var.key}"
}

