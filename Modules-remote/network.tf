# resource "aws_security_group" "security_group" {
#   name   = "security-group-${var.environment}"
#   vpc_id = module.network.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"
#     # cidr_blocks      = [aws_vpc.main.cidr_block]
#     cidr_blocks = ["0.0.0.0/0"] # não é recomendado fazer isso
#     # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_route_table_association" "rta" {
#   subnet_id      = module.network.vnet_subnets[0]
#   route_table_id = module.network.public_route_table_ids[0]
# }