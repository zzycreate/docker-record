#!/bin/bash
set -e

echo 'start mysql......'
service mysql start
sleep 3
service mysql status

echo 'start change privileges'
mysql < /mysql/privileges.sql
sleep 3
echo 'end change privileges'

echo 'over...'
tail -f /dev/null
