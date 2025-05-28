- `$ terraform init -upgrade` : Comando para criar o diretório `.terraform` que contém tudo que o binário precisa para rodar.
    - Só dá para usar se tiver arquivos `.tf` presentes no diretório;
    - `-upgrade` é utilizado para atualizar os plug-ins;

- `$ terraform plan`: compara o HCL com o `state`, definindo então como vai ser feito;
    - Use o `-out` para gerar um plano antes de executar o `apply`;
        - Exemplo: `$ terraform plan -out foo`, o `foo` é o nome do plano que será executado;

- `$ terraform apply`: Aplicação do plano. Ao aplicar o plano, ele gera também o `state` -> `.tfstate`;
    - O arquivo `state` idealmente não deve ficar no ambiente local, o correto é ficar em um local em que outras pessoas possam trabalhar com o `state`;
    - O `state` possui todas as informações da infraestrutura criada com o terraform;
    - Exemplo: `$ terraform apply foo`;

- `$ terraform destroy`: Para destruir tudo o que está definido no arquivo HCL;
