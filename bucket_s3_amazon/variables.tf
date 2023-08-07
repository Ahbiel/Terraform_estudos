variable "tags_globais" {
  type        = string
  default     = "Angelo Gabriel"
  description = "variável usado para compor as tags"
}

variable "nomeBucket" {
  type    = string
  default = "test-terraform-in-aws-angelo001"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-east-1"]
}

variable "tags_adcionais" {
  type = object({
    Project = string
    num     = string
  })
  sensitive = true
  default = {
    Project = "hello world"
    num     = "738174817237"
  }
}