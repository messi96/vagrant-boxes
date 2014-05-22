#!/bin/bash

. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

/u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < /root/sqlmap.sql

