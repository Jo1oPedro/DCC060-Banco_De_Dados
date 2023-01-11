# ggj-delivery

Para preparar o banco de dados execute os seguintes passos:

1. Execute o comando: `CREATE DATABASE nome_do_banco`;

2. Execute todo o script do arquivo `create_script.sql` para criar as tabelas;

3. Execute todo o script do arquivo `carga.sql` para carregar o banco com alguns dados;

4. Execute todo o script do arquivo `order_status_trigger.sql` para criar a trigger e procedure referente
à atualização do status do pedido;

5. Execute todo o script do arquivo `restaurant_rating_trigger.sql` para criar a trigger e procedure referente
à atualização da média e contagem de avaliações de um restaurante;
