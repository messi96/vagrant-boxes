grant usage on *.* to 'roller'@'localhost';
drop user 'roller'@'localhost';
create user 'roller'@'localhost' identified by 'roller';
drop database if exists rollerdb;
create database rollerdb;
grant all on rollerdb.* to roller@'%' identified by 'roller';

