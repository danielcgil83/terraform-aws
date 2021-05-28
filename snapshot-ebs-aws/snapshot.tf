# to import the ebs_volume state it's necessary to use the following block and after run the command:
# $ terraform import aws_ebs_volume.<volume_name_in_terraform> <volume_id>
resource "aws_ebs_volume" "manual" {
  availability_zone = "${var.aws_region}d"
  size = 8

  tags = {
    Name = "ebs-ubuntu"
  }
}


# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_ebs_snapshot" "this" {
  volume_id = aws_ebs_volume.manual.id

  tags = local.common_tags  # the tags are storaged at locals.tf file so they can be used several times
}