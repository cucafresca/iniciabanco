#!/bin/bash

echo "INSTALAÇÃO POSTGRESQL 10.11 UBUNTU_SERVER Aperte ENTER para continuar"
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
echo "Digite a senha 123456 confirme a mesma e Aperte ENTER"
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

echo "Primeira parte finalizada logue com usuario POSTGRES e execute o script inst_ubuntu_server2.sh"
