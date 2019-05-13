variable "instance_name" {
  description = "use to give name to Instance."
  default     = ""
}

variable "postgre_count" {
  default = ""
  description = "Number of instances/volumes to create."
}



variable "postgre_size" {
  default = ""
  description = "Size of volume to be created in GB."
}


variable "postgre_flavor_is" {
  default = ""
}


variable "region" {
  default = ""
}



variable "team_maintaining" {
  default = ""
}


variable "image_id" {
  default = ""
}


variable "key" {
  default = ""
}

variable "security_group" {
  default = ""
}

variable "network" {
  default = ""
}

variable "ip_pool" {
  default = ""
}

variable "network_name" {
  default = ""
}


variable "user" {
  default = ""
}

variable "ssh_key" {
  default = ""
}




variable "az" {
  default = ""
}
