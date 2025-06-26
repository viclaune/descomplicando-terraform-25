# Conhecendo o Terraform
Terraform é um binário que carrega o arquivo de formato HCL, neste escrevemos o que desejamos configurar. O terraform então se conecta com a API da cloud e a partir daí ele passa comandos de acordo com o que está no arquivo descritivo (HCL).

O `state file` é um arquivo gerado pelo terraform após ele criar o que foi passado no arquivo descritivo (HCL). Ele armazena o último estado da arquitetura criada com o terraform, e utiliza ele para comparar a arquitetura quando se depara com outro arquivo HCL, para saber se ele deve criar/alterar/deletar recursos na cloud.


Documentação do terraform:
https://developer.hashicorp.com/terraform/docs

# Entendendo o HCL
HCL é o formato padrão que será usado/lido pelo terraform.
Dentro de um arquivo HCL temos dois elementos muito importantes:
- **Blocos**
    - Blocos são unidades de configuração que definem algum tipo de recursos, configuração, ou estrutura. Começam com um **tipo**, seguido por argumentos opcionais e um **corpo** delimitado por `{}`;
        ```python
        resource "aws_instance" "example" {
            ami = "abc123"

            network_interface {
                #...
            }
        
        }
        ```
        - `resource` é o tipo do bloco - é o que cria a infraestrutura;
        - `aws_instance` é o tipo de resource que desejamos criar; - No [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) conseguimos coletar todos os resources e informações de cada resource;
        - `example` é o nome do recurso - nós escolhemos o nome;
        - o `network_interface` é um bloco interno, aninhado ao recurso `aws_instance`;
        - São tipos comuns de blocos:
            - `provider`: define o provedor;
            - `variable`: declara variáveis reutilizáveis;
            - `output`: exibe valores após a aplicação;
- **Argumentos**
    - É tudo que está dentro de um bloco, geralmente é especificado em chave/valor.
    - `ami = 'abc123'`

Outro elemento importante que vive dentro dos arquivos HCLs:
- **Identificadores**
    - Forma que podemos utilizar para identificar os recursos.
    - Imagine estarmos utilizando o bloco `data` para fazer a coleta de alguma informação, que tem como parâmetros `'aws_ami' 'ubuntu'`, posso utilizar a seguinte estrutura para coletar um retorno do data:
        - `data.aws_ami.ubuntu.id`
        - o `id` é um atributo, é uma saída do bloco.

> **Ponto importante**: O que se coloca dentro dos blocos são argumentos, os outputs dos blocos são atributos. Nos exemplos já apresentados: o `ami = 'abc123'` é um argumento, e o `.id` é um atributos;

Por fim, vamos falar também sobre os **Comentários**, que podem ser feitos com:
- `#`: para comentário em linha única; 
- `//`: para comentário em linha única;
- `/* */`: para comentário em múltiplas linhas;

# Comandos básicos
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

# Backend Remoto
Backend -> Onde guardamos o `state file`; 
Por padrão, o backend é local, mas podemos usar o bloco `backend` para definir outro local;

Adicionado o bloco `backend` no arquivo [providers.tf](../app/src/providers.tf)

# Expressions
`Expressions` são valores que vamos informar ao HCL; Possuem diferentes tipos:
- String, Number, Bool, List, Set, Map, Null;

Exemplo de `Expressions`:
```py
terraform {
    
    # ...

    backend "s3" {
      bucket = "mybucket-test"
      key="path/to/my/bucket"
      region="us-east-1"
    }
}
```
No exemplo acima, temos como expressions:
- `"mybucket-test"`
- `"path/to/my/bucket"`
- `"us-east-1`