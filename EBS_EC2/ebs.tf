resource "aws_ebs_volume" "ebs_ec2" {
  availability_zone = "us-east-1b"
  type              = "gp3"
  size              = 25
  iops              = 3000
  throughput        = 125

  tags = {
    Name = "gp3_volumes"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.ebs_ec2.id
  instance_id  = "instance_id"
  skip_destroy = true
}