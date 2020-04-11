#!/bin/bash

echo "Vamos criar criar a estrutura do Postgresql"
echo "Aperte enter para continuar"
read

cd /usr/local/bin

echo "Será solicitado a senha do usuário Postgres digite 123456"
echo "aperte Enter para continuar"

./initdb -U postgres -W -A md5 --locale=pt_BR.ISO-8859-1 -D /home/cuca/postgresql/10/data/

echo "Estrutura criada com sucesso"
echo "Aperte ENTER para continuar"
read

cd /home/cuca/postgresql/10/data
rm -f cucafresca.conf* postgresql.conf* pg_hba.conf*

echo "Agora vamos baixar os arquivos necessarios para configurar o POSTGRESQL"
echo "Aperte Enter para continuar"
read

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/cucafresca.conf

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/postgresql.conf

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/pg_hba.conf

echo "Instalação finalizada com sucesso"
echo "Para INICIAR o banco de dados execute o comando pg_ctl start"







