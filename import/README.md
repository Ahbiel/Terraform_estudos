## import
Para usar o import, primeiro eu preciso criar um bloco de resource referenciando o recurso que quero importar, e depois executar o seguinte comando:
```rb
terraform init
terraform import RESOURCE_TYPE.RESOURCE_NAME ID
```
onde:
- **RESOURCE_TYPE** é o tipo de recurso que você está importando (por exemplo, aws_instance, google_compute_instance, etc.).
- **RESOURCE_NAME** é o nome do recurso no Terraform que você deseja associar ao recurso importado.
- **ID** é o identificador único do recurso no provedor de infraestrutura. Geralmente, é um valor que você obtém do próprio provedor.

Após executar esse comando, será criado um estado em nossa máquina local sobre o recurso importado