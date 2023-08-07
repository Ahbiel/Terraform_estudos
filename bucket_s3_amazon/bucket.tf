resource "aws_s3_bucket" "my_fisrt_bucket" { #o nome é opcional
  # bucket = "test-terraform-in-aws-angelo001"
  bucket = var.nomeBucket

  tags = {
    Project = var.tags_adcionais.Project
    Num     = var.tags_adcionais.num
  }
}
