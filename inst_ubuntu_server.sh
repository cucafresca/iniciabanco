#!/bin/bash

echo "INSTALAÇÃO POSTGRESQL 10.11 UBUNTU SERVER Aperte ENTER para continuar"
read #pause até que o ENTER seja pressionado

cd /

wget https://ftp.postgresql.org/pub/source/v10.11/postgresql-10.11.tar.gz

tar -zxvf postgresql-10.11.tar.gz

mv postgresql-10.11 /usr/local/src

echo "Será instalado o pacote Buil-Essential digite y e clique em ENTER"

apt-get install build-essential

cd /usr/local/src

cd postgresql-10.11/

./configure --without-readline --without-zlib --prefix=/usr/local
make 
make
make install
make install

cd /usr/local/src/postgresql-10.11/contrib

make
make
make install
make install

echo "Agora vamos Criar o usuario Postgres"
echo "Digite a senha 123456 e Aperte ENTER"
echo "Aperte ENTER para continuar"
read

adduser postgres

echo "Agora vamos criar a pasta DATA e atribuir as permissões para a mesma, por padrão vamos deixar a pasta no local /home/servidor/cuca/postgresql/10/data"
echo "Aperte ENTER para continuar"
read

mkdir -p /home/servidor/cuca/postgresql/10/data
chmod 777 /home/servidor/cuca/postgresql/10/data
chown -R postgres /home/servidor/cuca/postgresql
chmod -R 0700 /home/servidor/cuca/postgresql

cd /etc

echo "export PGDATA=/usr/local/bin" >> bash.bashrc
echo "export PGDATA=/home/servidor/cuca/postgresql/10/data" >> bash.bashrc

echo "Agora será configurado o locales selecione a opção PT_BR ISO-8859-1 e pt_BR clique em OK "
echo "Caso não selecionar a opção PT_BR ISO-8859-1 o banco não será instalado corretamente"
echo "Aperte ENTER e Selecione a opção PT_BR ISO-8859-1 e pt_BR"
read

dpkg-reconfigure locales

locale -a

echo "Vamos logar com usuario postgres digite a senha 123456"
echo "Aperte enter para continuar"
read

su postgres

cd /usr/local/bin

echo "Será solicitado novamente a senha do usuário Postgres digite 123456"
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

systemctl start postgresql.service

echo "Instalação finalizada agora o linux será reiniciado aperte ENTER"

read

reboot


