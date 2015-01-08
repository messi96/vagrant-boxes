create user jforum identified by jforum;
grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK,
CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM,
CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE,
CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE 
to jforum;

CONNECT jforum/jforum;

@/opt/apache-tomcat/webapps/jforum-2.1.9/WEB-INF/config/database/oracle/oracle_drop_tables.sql;
@/opt/apache-tomcat/webapps/jforum-2.1.9/WEB-INF/config/database/oracle/oracle_db_struct.sql;
@/opt/apache-tomcat/webapps/jforum-2.1.9/WEB-INF/config/database/oracle/oracle_data_dump.sql;

commit;
