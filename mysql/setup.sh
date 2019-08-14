#!/bin/bash

echo 'start mysql......'
service mysql start
sleep 3
service mysql status

echo 'start change privileges'
mysql -hlocalhost -uroot -p$1 < /mysql/privileges.sql
sleep 3
echo 'end change privileges'

echo 'over...'
