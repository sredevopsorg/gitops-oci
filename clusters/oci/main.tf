terraform {
  required_version = ">= 0.13"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_instance" "generated_oci_core_instance" {
  count = 2
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "ENABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Bastion"
    }
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = "CQhm:SA-SANTIAGO-1-AD-1" # Availability Domain for Chile, if you are in another zone you should review this 
  compartment_id      = var.compartment_id
  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = "true"
    subnet_id                 = oci_core_subnet.generated_oci_core_subnet.id
  }
  display_name = "gitops-oci-${count.index}"
  fault_domain = "FAULT-DOMAIN-2"
  freeform_tags = {
    "sredevops" = "true"
  }
  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }
  is_pv_encryption_in_transit_enabled = "true"
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  shape = "VM.Standard.A1.Flex"
  shape_config {
    memory_in_gbs = "12"
    ocpus         = "2"
  }
  source_details {
    boot_volume_size_in_gbs = "50"
    boot_volume_vpus_per_gb = "10"
    source_id               = "ocid1.image.oc1.sa-santiago-1.aaaaaaaaadiqnbco7egs2umnubgaqxv64qxs4jfr7gyqb7u5sy56qtgxk4eq" # Ubuntu 22.04 LTS aarch64
    source_type             = "image"
  }
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "vcn-sredevops-root"
  dns_label      = "vcn02072354"
  /* dns_label = "dns-vcn-sredevops-root" */
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
  cidr_block     = "10.0.10.0/24"
  compartment_id = var.compartment_id
  display_name   = "subnet-sredevops-root"
  dns_label      = "subnet02072354"
  /* dns_label = "dns-subnet-sredevops-root" */
  route_table_id = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
  vcn_id         = oci_core_vcn.generated_oci_core_vcn.id
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "Internet Gateway vcn-sredevops-root"
  enabled        = "true"
  vcn_id         = oci_core_vcn.generated_oci_core_vcn.id
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.generated_oci_core_internet_gateway.id
  }
  manage_default_resource_id = oci_core_vcn.generated_oci_core_vcn.default_route_table_id
  compartment_id             = var.compartment_id
  display_name               = "Default Route Table vcn-sredevops-root"

}
