-- ������� ���� ������ example

create database if not exists example;
use example;
drop table if exists users;
create table users(
    id SERIAL primary key,
    name varchar(100)
) COMMENT = '������� users';

/* �������� ����� � �������: 
 * mysqldump example > C:\Users\Device\example_dump.sql
 * ������������� ����:
 * mysql example < C:\Users\Device\example_dump.sql
 */

/*������� dump ������ 100 �������
 *mysqldump --where="true limit 100" mysql --tables help_keyword > C:\Users\Device\mysql_help_keyword_dump.sql
 */