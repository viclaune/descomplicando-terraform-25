Terraform é um binário que carrega o arquivo de formato HCL, neste escrevemos o que desejamos configurar. O terraform então se conecta com a API da cloud e a partir daí ele passa comandos de acordo com o que está no arquivo descritivo (HCL).

O `state file` é um arquivo gerado pelo terraform após ele criar o que foi passado no arquivo descritivo (HCL). Ele armazena o último estado da arquitetura criada com o terraform, e utiliza ele para comparar a arquitetura quando se depara com outro arquivo HCL, para saber se ele deve criar/alterar/deletar recursos na cloud.


Documentação do terraform:
https://developer.hashicorp.com/terraform/docs