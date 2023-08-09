# Criando uma bucket s3
resource "aws_s3_bucket" "my_fisrt_bucket" { #o nome é opcional
  bucket = "test-terraform-in-aws-angelo001"
}

