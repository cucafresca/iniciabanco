#!/bin/bash

echo "Vamos criar agora a estrutura do POSTGRESQL"
echo "Aperte enter para continuar"
read

cd /usr/local/bin

echo "Será solicitado a senha do usuário Postgres digite 123456"
echo "aperte Enter para continuar"

./initdb -U postgres -W -A md5 --locale=pt_BR.ISO-8859-1 -D /home/servidor/cuca/postgresql/10/data/

echo "Estrutura criada com sucesso"
echo "Aperte ENTER para continuar a instalação"
read

cd /home/cuca/postgresql/10/data
rm -f cucafresca.conf* postgresql.conf* pg_hba.conf*

echo "Agora vamos baixar os arquivos necessarios para configurar o POSTGRESQL"
echo "Aperte Enter para continuar"
read

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/cucafresca.conf

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/postgresql.conf

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/pg_hba.conf

echo "Será baixado e instalado o Script para inicialização automática do Postgresql"
echo "Aperte ENTER para continuar"
read

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/iniciabanco.sh

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/postgresql.service

chmod +x iniciabanco.sh

chmod 777 iniciabanco.sh

mv iniciabanco.sh /etc/systemd/system

mv postgresql.service /etc/systemd/system

cd /etc/systemd/system/

systemctl daemon-reload

systemctl enable postgresql.service

echo "Instalação finalizada agora REINICIE O SEU SERVIDOR"
echo "Aperte ENTER"
read
