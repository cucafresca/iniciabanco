#!/bin/bash

echo "inicialização Postgresql"

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/banco.sh

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/postgresql.service

chmod 777 banco.sh

mv banco.sh /home/postgres

mv postgresql.service /lib/systemd/system

cd /lib/systemd/system/

systemctl daemon-reload

systemctl enable postgresql.service

systemctl start postgresql.service
