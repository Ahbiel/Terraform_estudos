# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.small"
  availability_zone           = "us-east-1a"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id # poderia atribuir automaticamente
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true # atribuir um ip público automaticamente

  tags = {
    Name = "InstanciaEC2"
  }
}