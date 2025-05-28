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