#!/bin/bash

echo "inicialização Postgresql"

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/iniciabanco.sh

wget https://raw.githubusercontent.com/cucafresca/iniciabanco/master/postgresql.service

chmod 777 iniciabanco.sh

mv iniciabanco.sh /etc/systemd/system

mv postgresql.service /etc/systemd/system

cd /etc/systemd/system/

systemctl daemon-reload

systemctl enable postgresql.service

systemctl start postgresql.service
