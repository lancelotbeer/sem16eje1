Last login: Mon Oct  1 19:54:35 on ttys000
MacBook-Air-de-mcbook:~ mcbookair$ psql
psql (10.5)
Type "help" for help.

mcbookair=# \c call_list
You are now connected to database "call_list" as user "mcbookair".
call_list=# select * from users
call_list-# ;
ERROR:  relation "users" does not exist
LINE 1: select * from users
                      ^
call_list=# select * from users
;
ERROR:  relation "users" does not exist
LINE 1: select * from users
                      ^
call_list=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 mcbookair | Superuser, Create role, Create DB                          | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

call_list=#
call_list=# \dt
Did not find any relations.
call_list=# CREATE TABLE users(
id intenger,
first_name VARCHAR(30),
emmail VARCHAR(30));
CREATE TABLE users (id SERIAL, name VARCHAR(50), email VARCHAR(50));
ERROR:  type "intenger" does not exist
LINE 2: id intenger,
           ^
CREATE TABLE
call_list=# CREATE TABLE users (id SERIAL primary key, first_name VARCHAR(50), email VARCHAR(50));
ERROR:  relation "users" already exists
call_list=# |dt users
call_list-# select * from user
;
ERROR:  syntax error at or near "|"
LINE 1: |dt users
        ^
call_list=#
select * from user
;
   user
-----------
 mcbookair
(1 row)

call_list=# insert into user values carlos, carlos@gmail.com;
ERROR:  syntax error at or near "user"
LINE 1: insert into user values carlos, carlos@gmail.com;
                    ^
call_list=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | users | table | mcbookair
(1 row)

call_list=# insert into users values carlos, carlos@gmail.com;
ERROR:  syntax error at or near "carlos"
LINE 1: insert into users values carlos, carlos@gmail.com;
                                 ^
call_list=# insert into user values 'carlos', 'carlos@gmail.com';
ERROR:  syntax error at or near "user"
LINE 1: insert into user values 'carlos', 'carlos@gmail.com';
                    ^
call_list=# insert into users values 'carlos', 'carlos@gmail.com';
ERROR:  syntax error at or near "'carlos'"
LINE 1: insert into users values 'carlos', 'carlos@gmail.com';
                                 ^
call_list=# insert into users values ('carlos', 'carlos@gmail.com');
ERROR:  invalid input syntax for integer: "carlos"
LINE 1: insert into users values ('carlos', 'carlos@gmail.com');
                                  ^
call_list=# insert into users (first_name, email) values ('carlos', 'carlos@gmail.com');
ERROR:  column "first_name" of relation "users" does not exist
LINE 1: insert into users (first_name, email) values ('carlos', 'car...
                           ^
call_list=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | users | table | mcbookair
(1 row)

call_list=# select * from users
call_list-# ;
 id | name | email
----+------+-------
(0 rows)

call_list=# insert into users (name, email) values ('carlos', 'carlos@gmail.com');
INSERT 0 1
call_list=# insert into users (name, email) values ('laura', 'laura@gmail.com')
call_list-# ;
INSERT 0 1
call_list=# select * from users                                                 ;
 id |  name  |      email
----+--------+------------------
  1 | carlos | carlos@gmail.com
  2 | laura  | laura@gmail.com
(2 rows)
call_list=# create table calls (id serial primary_key, phone integer, date date, user_id integer references users(id));
ERROR:  syntax error at or near "primary_key"
LINE 1: create table calls (id serial primary_key, phone integer, da...
                                      ^
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references user(id));
ERROR:  syntax error at or near "user"
LINE 1: ...ne integer, date date, user_id integer references user(id));
                                                             ^
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, users_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, users_id integer references user(id));
ERROR:  syntax error at or near "user"
LINE 1: ...e integer, date date, users_id integer references user(id));
                                                             ^
call_list=# create table calls (id serial primary key, phone integer, date date, users_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references user(id));
ERROR:  syntax error at or near "user"
LINE 1: ...ne integer, date date, user_id integer references user(id));
                                                             ^
call_list=# create table calls (id serial primary key, phone integer, date date, users_id integer references user(id));
ERROR:  syntax error at or near "user"
LINE 1: ...e integer, date date, users_id integer references user(id));
                                                             ^
call_list=# create table calls (id serial primary key, phone integer, date date, users_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# select * from users                                                                ;
 id |  name  |      email
----+--------+------------------
  1 | carlos | carlos@gmail.com
  2 | laura  | laura@gmail.com
(2 rows)

call_list=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | users | table | mcbookair
(1 row)

call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
ERROR:  there is no unique constraint matching given keys for referenced table "users"
call_list=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | users | table | mcbookair
(1 row)

call_list=# alter table alter table libros
call_list-# ;
ERROR:  syntax error at or near "table"
LINE 1: alter table alter table libros
                          ^
call_list=# alter table users add primary key (id);
ALTER TABLE
call_list=# create table calls (id serial primary key, phone integer, date date, user_id integer references users(id));
CREATE TABLE
call_list=# alter table users add column last_name;
ERROR:  syntax error at or near ";"
LINE 1: alter table users add column last_name;
                                              ^
call_list=# alter table users add column last_name
call_list-# alter table users add column last_name varchard(50);
ERROR:  syntax error at or near "table"
LINE 2: alter table users add column last_name varchard(50);
              ^
call_list=# alter table users add column last_name varchar(50);
ALTER TABLE
call_list=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | calls | table | mcbookair
 public | users | table | mcbookair
(2 rows)

call_list=# insert into users values (carlos, perez);
ERROR:  column "carlos" does not exist
LINE 1: insert into users values (carlos, perez);
                                  ^
call_list=# insert into users(last_name) values (perez);
ERROR:  column "perez" does not exist
LINE 1: insert into users(last_name) values (perez);
                                             ^
call_list=# update users set last_name 'perez' where name = 'carlos';
ERROR:  syntax error at or near "'perez'"
LINE 1: update users set last_name 'perez' where name = 'carlos';
                                   ^
call_list=# update users set last_name (perez) where name = 'carlos';
ERROR:  syntax error at or near "("
LINE 1: update users set last_name (perez) where name = 'carlos';
                                   ^
call_list=# update users set last_name perez where name = 'carlos';
ERROR:  syntax error at or near "perez"
LINE 1: update users set last_name perez where name = 'carlos';
                                   ^
call_list=# select * from users
call_list-# select * from users;
ERROR:  syntax error at or near "select"
LINE 2: select * from users;
        ^
call_list=# select * from users;
 id |  name  |      email       | last_name
----+--------+------------------+-----------
  1 | carlos | carlos@gmail.com |
  2 | laura  | laura@gmail.com  |
(2 rows)

call_list=# update users set last_name='perez' where name = 'carlos';
UPDATE 1
call_list=# select * from users;
 id |  name  |      email       | last_name
----+--------+------------------+-----------
  2 | laura  | laura@gmail.com  |
  1 | carlos | carlos@gmail.com | perez
(2 rows)

call_list=# update users set last_name='soto' where name = 'laura';
UPDATE 1
call_list=# select * from users;
 id |  name  |      email       | last_name
----+--------+------------------+-----------
  1 | carlos | carlos@gmail.com | perez
  2 | laura  | laura@gmail.com  | soto
(2 rows)

call_list=# insert into calls (phone, date, user_idfk) values (1234,'1999/06/24'users_id(2));
ERROR:  syntax error at or near "users_id"
LINE 1: ...(phone, date, user_idfk) values (1234,'1999/06/24'users_id(2...
                                                             ^
call_list=# insert into calls (phone, date, user_idfk) values (1234,'19990624',2);
ERROR:  column "user_idfk" of relation "calls" does not exist
LINE 1: insert into calls (phone, date, user_idfk) values (1234,'199...
                                        ^
call_list=# insert into calls (phone, date, users_id) values (1224,'19840624',2);
ERROR:  column "users_id" of relation "calls" does not exist
LINE 1: insert into calls (phone, date, users_id) values (1224,'1984...
                                        ^
call_list=# insert into calls (phone, date, users_id) values (1224,'1984-06-24',2);
ERROR:  column "users_id" of relation "calls" does not exist
LINE 1: insert into calls (phone, date, users_id) values (1224,'1984...
                                        ^
call_list=# insert into calls (phone, date, users_id) values (1224,'1984-06-24',2);
ERROR:  column "users_id" of relation "calls" does not exist
LINE 1: insert into calls (phone, date, users_id) values (1224,'1984...
                                        ^
call_list=# select * from users;
 id |  name  |      email       | last_name
----+--------+------------------+-----------
  1 | carlos | carlos@gmail.com | perez
  2 | laura  | laura@gmail.com  | soto
(2 rows)

call_list=# insert into calls (phone, date, users_id) values (1224,'1984-06-24',2);
ERROR:  column "users_id" of relation "calls" does not exist
LINE 1: insert into calls (phone, date, users_id) values (1224,'1984...
                                        ^
call_list=# insert into calls (phone, date, user_id) values (1224,'1984-06-24',2);
INSERT 0 1
call_list=# select * from users;
 id |  name  |      email       | last_name
----+--------+------------------+-----------
  1 | carlos | carlos@gmail.com | perez
  2 | laura  | laura@gmail.com  | soto
(2 rows)

call_list=# insert into calls (phone, date, user_id) values (4567,'1894-08-30',2);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (4938,'1890-02-12',2);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (7777,'1891-07-22',2);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (7777,'1892-02-14',2);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (5867,'1893-07-28',2);
INSERT 0 1
call_list=# select * from calls;
 id | phone |    date    | user_id
----+-------+------------+---------
  1 |  1224 | 1984-06-24 |       2
  2 |  4567 | 1894-08-30 |       2
  3 |  4938 | 1890-02-12 |       2
  4 |  7777 | 1891-07-22 |       2
  5 |  7777 | 1892-02-14 |       2
  6 |  5867 | 1893-07-28 |       2
(6 rows)

call_list=# insert into calls (phone, date, user_id) values (5867,'2010-07-28',1);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (6666,'2010-09-11',1);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (6666,'2018-10-15',1);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (6666,'2018-10-22',1);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (6666,'2018-11-26',1);
INSERT 0 1
call_list=# insert into calls (phone, date, user_id) values (6666,'2018-12-29',1);
INSERT 0 1
call_list=# select * from calls;
 id | phone |    date    | user_id
----+-------+------------+---------
  1 |  1224 | 1984-06-24 |       2
  2 |  4567 | 1894-08-30 |       2
  3 |  4938 | 1890-02-12 |       2
  4 |  7777 | 1891-07-22 |       2
  5 |  7777 | 1892-02-14 |       2
  6 |  5867 | 1893-07-28 |       2
  7 |  5867 | 2010-07-28 |       1
  8 |  6666 | 2010-09-11 |       1
  9 |  6666 | 2018-10-15 |       1
 10 |  6666 | 2018-10-22 |       1
 11 |  6666 | 2018-11-26 |       1
 12 |  6666 | 2018-12-29 |       1
(12 rows)

call_list=# insert into users (name, email, last_name) values (jose, jose@gmail.com, lara);
ERROR:  column "jose" does not exist
LINE 1: ...nsert into users (name, email, last_name) values (jose, jose...
                                                             ^
call_list=# insert into users (name, email, last_name) values ('jose', 'jose@gmail.com', 'lara');
INSERT 0 1
call_list=# select name, count(*) from users, calls where users.id = calls.users_id group by name;
ERROR:  column calls.users_id does not exist
LINE 1: ...name, count(*) from users, calls where users.id = calls.user...
                                                             ^
HINT:  Perhaps you meant to reference the column "calls.user_id".
call_list=# select name, count(*) from users, calls where user.id = calls.users_id group by name;
ERROR:  syntax error at or near "."
LINE 1: select name, count(*) from users, calls where user.id = call...
                                                          ^
call_list=# select name, count(*) from users, calls where users.id = calls.user_id group by name;
  name  | count
--------+-------
 laura  |     6
 carlos |     6
(2 rows)

call_list=# select calls.id, name from users inner join calls on users.id = calls.user_idfk where name = 'carlos' order by date desc;
ERROR:  column calls.user_idfk does not exist
LINE 1: ...d, name from users inner join calls on users.id = calls.user...
                                                             ^
HINT:  Perhaps you meant to reference the column "calls.user_id".
call_list=# select calls.id, name from users inner join calls on users.id = calls.user_id where name = 'carlos' order by date desc;
 id |  name
----+--------
 12 | carlos
 11 | carlos
 10 | carlos
  9 | carlos
  8 | carlos
  7 | carlos
(6 rows)

call_list=#
