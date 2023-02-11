output "instance_ids" {
  value = [for i in oci_core_instance.generated_oci_core_instance: i.id]
}

output "instance_private_ips" {
  value = [for i in oci_core_instance.generated_oci_core_instance: i.private_ip]
}

output "instance_public_ips" {
  value = [for i in oci_core_instance.generated_oci_core_instance: i.public_ip]
}

output "vcn_id" {
  value = oci_core_vcn.generated_oci_core_vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.generated_oci_core_subnet.id
}

output "internet_gateway_id" {
  value = oci_core_internet_gateway.generated_oci_core_internet_gateway.id
}
