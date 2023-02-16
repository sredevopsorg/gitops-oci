variable "compartment_id" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "ssh_authorized_keys" {}
variable "region" {}
variable "tenancy_ocid" {}


variable "ssh_public_key" {}

variable "image_ocid" {}

/* variable "ssh_private_key_path" {} */

variable "ssh_private_key" {}

variable "cluster_token" {}

variable "compartment_ocid" {}

variable "current_user_ocid" {}

variable "private_key" {}



variable "vcn_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}
