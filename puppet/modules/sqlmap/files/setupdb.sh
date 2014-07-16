#!/bin/bash

. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < /root/sqlmap/system.sql
sqlplus SYS/testpass@//127.0.0.1:1521/XE AS SYSDBA < /root/sqlmap/create_user.sql
sqlplus user/password@//127.0.0.1:1521/XE              < /root/sqlmap/data.sql

