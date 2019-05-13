
variable "user" {
  description = "user"
  default     = "Moksha"
}

variable "instance_name" {
  description = "use to give name to Instance."
  default     = "Moksha"
}

variable "password" {
  description = "userpassword"
  default     = "Moksha"
}

variable "authUrl" {
  description = "authorization url of your project"
  default     = ""
}

variable "tenantId" {
  description = "ID of your project"
  default     = ""
}

variable "domainId" {
  description = "ID of your domain"
  default     = ""
}
variable "domainName" {
 description = "Name of the domain"
 default = "hcp03"
}

variable "zkcs_size" {
  default = "3"
  description = "Size of volume to be created in GB."
}

variable "zkcs_flavor_is" {
  default = "3"
}

variable "rmp_size" {
  default = "2"
  description = "Size of volume to be created in GB."
}

variable "rmp_flavor_is" {
  default = "2"
}

variable "postgre_size" {
  default = "3"
  description = "Size of volume to be created in GB."
}

variable "postgre_flavor_is" {
  default = "3"
}

variable "region" {
  default = "EU-MUC-1"
}

variable "team_maintaining" {
  default = "TNZOperations"
}

variable "image_id" {
  default = ""
}

variable "key" {
  default = "moksha-key-pair"
}

variable "security_group" {
  default = "default"
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


variable "username" {
  default = "tnz-user"
}

variable "ssh_key" {
  default = "/home/tnz-user/.ssh/id_rsa"
}


variable "az_1" {
  default = "eu-muc-1a"
}

variable "az_2" {
  default = "eu-muc-1b"
}

variable "az_3" {
  default = "eu-muc-1c"
}
