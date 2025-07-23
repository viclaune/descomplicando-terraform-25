# State
O state é o mapeamento que garante a consistência do que tem em código com a infra criada. Esse mapeamento faz o "cara-crachá" e verifica o que deve ser feito comparando com o que já existe, se precisa criar, modificar ou excluir alguma coisa na cloud. Com o Remote State você garante que outras pessoas que trabalham na mesma conta tenham acesso aos benefícios do state.

Alguns comandos com `terraform state`:
- `list`: Lista os objetos que estão no state;
- `pull`: Puxa o estado corrente e joga na saída padrão;
- `push`: (Não aconselhável fazer!) é possível pegar um arquivo com o pull e fazer um push para subir o state;

# Locking state


# Workspaces
# Import
# Outputs e terraform_remote_state