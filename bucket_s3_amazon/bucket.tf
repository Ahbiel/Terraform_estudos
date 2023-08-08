# Criando uma bucket s3
resource "aws_s3_bucket" "my_fisrt_bucket" { #o nome é opcional
  # bucket = "test-terraform-in-aws-angelo001"
  bucket = var.nomeBucket

  tags = {
    Project = local.Project
    Num     = local.Num
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_fisrt_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Criando um objeto dentro dessa bucket
resource "aws_s3_object" "my_first_object" {
  bucket = aws_s3_bucket.my_fisrt_bucket.id #Referenciando atributos
  key    = "docker-compose.yml"
  source = "../docker-compose.yml"
}
