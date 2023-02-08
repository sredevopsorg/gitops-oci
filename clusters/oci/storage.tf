resource "oci_core_volume" "shared_50gb_oci_core_volume" {
	availability_domain = "CQhm:SA-SANTIAGO-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa3qg5nvuc7y45e7cmxe64lctbhh6j7v2vggqioyymrkjpi5i3mm7q"
	display_name = "50gb_shared"
	freeform_tags = {
		"sredevops" = "true"
	}
	is_auto_tune_enabled = "false"
	size_in_gbs = "50"
	vpus_per_gb = "10"
}
