## Criar um pâr de chaves para a AWS

Primeiro, vamos excutar o seguinte comando:
```sh
ssh-keygen -f aws-key
```
Depois, vamos utilizar essa chave criada e armazenar dentro da aws, com o seguinte bloco de comando:

```rb
resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}
```

Esse comando serve para anexar uma chave dentro da AWS, não havendo necessidade caso já haja uma chave anexada

E, para poder usa-lá dentro de um bloco de resorce, podemos executar a seguinte linha de comando dentro do bloco
```rb
key-name = aws_key_pair.key.name
```