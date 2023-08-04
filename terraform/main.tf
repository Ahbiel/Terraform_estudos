terraform {
  required_version = "~> 1.5.0" #1.5.0 ate 1.5.n
  # podemos trabalhar com os seguintes operadores:
  # =: permite somente uma versão exata (= 1.5.3)
  # != excluí uma versão exata (!= 1.5.0 -> o terraform não irá trabalhar com essa versão)
  # >, >=, <, <=: operadores logicos de maior/menor/igual (>= 1.3.0) (>= 1.0.0, < 1.3.0)
  # ~> permite que apenas o componente da versão mais a direita seja incrementado

  required_providers {
    aws = {
      version = "5.11.0"
      source  = "hashicorp/aws"
    }
  }
}
