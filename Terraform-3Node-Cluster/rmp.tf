module "rmp1" {
  source           = "./rmp"
  instance_name    = "${var.instance_name}_01"
  region           = "${var.region}"
  rmp_size         = "${var.rmp_size}"
  image_id         = "${var.image_id}"
  rmp_flavor_is    = "${var.rmp_flavor_is}"
  security_group   = "${var.security_group}"
  az               = "${var.az_1}"
  network_name     = "${var.network_name}"
  network          = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key          = "${var.ssh_key}"
  user             = "${var.user}"
  key              = "${var.key}"
}

module "rmp2" {
  source           = "./rmp"
  instance_name    = "${var.instance_name}_02"
  region           = "${var.region}"
  rmp_size         = "${var.rmp_size}"
  image_id         = "${var.image_id}"
  rmp_flavor_is    = "${var.rmp_flavor_is}"
  security_group   = "${var.security_group}"
  az               = "${var.az_1}"
  network_name     = "${var.network_name}"
  network          = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key          = "${var.ssh_key}"
  user             = "${var.user}"
  key              = "${var.key}"
}

module "rmp3" {
  source           = "./rmp"
  instance_name    = "${var.instance_name}_01"
  region           = "${var.region}"
  rmp_size         = "${var.rmp_size}"
  image_id         = "${var.image_id}"
  rmp_flavor_is    = "${var.rmp_flavor_is}"
  security_group   = "${var.security_group}"
  az               = "${var.az_2}"
  network_name     = "${var.network_name}"
  network          = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key          = "${var.ssh_key}"
  user             = "${var.user}"
  key              = "${var.key}"
}

module "rmp4" {
  source           = "./rmp"
  instance_name    = "${var.instance_name}_02"
  region           = "${var.region}"
  rmp_size         = "${var.rmp_size}"
  image_id         = "${var.image_id}"
  rmp_flavor_is    = "${var.rmp_flavor_is}"
  security_group   = "${var.security_group}"
  az               = "${var.az_2}"
  network_name     = "${var.network_name}"
  network          = "${var.network}"
  team_maintaining = "${var.team_maintaining}"
  ssh_key          = "${var.ssh_key}"
  user             = "${var.user}"
  key              = "${var.key}"
}