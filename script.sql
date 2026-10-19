create schema if not exists SALAM; --Skema SALAM

create table salam.mahasiswas (
nim VARCHAR(10) not null, --Primary Key
nama VARCHAR(100) not null,
email VARCHAR(50) not null, --Unique Constraint
jenis_kelamin CHAR(1), --Check Constraint
no_hp VARCHAR(15),
jurusan VARCHAR(50) not null,

constraint pk_mahasiswas primary key (nim),
constraint uc_email unique (email),
constraint cc_jenis_kelamin check (jenis_kelamin in ('L', 'P'))
)

insert into salam.mahasiswas (nim, nama, email, jenis_kelamin, no_hp, jurusan)
values (
'1247050079',
'Meutia Hasna Syahida',
'1247050079@student.uinsgd.ac.id',
'P',
'08888230148',
'Teknik Informatika');

--Data Dummy
--Untuk tes Unique Constraint
insert into salam.mahasiswas (nim, nama, email, jenis_kelamin, no_hp, jurusan)
values (
'1247050080',
'Ada Lovelace',
'1247050079@student.uinsgd.ac.id',
'P',
'081234567890',
'Teknik Informatika');

--Data Dummy
--Untuk tes Check Constraint
insert into salam.mahasiswas (nim, nama, email, jenis_kelamin, no_hp, jurusan)
values (
'1247050081',
'Alan Turing',
'1247050081@student.uinsgd.ac.id',
'X',
'08987654321',
'Teknik Informatika');

--User baru
create user backend_dev with password 'backend123';
create user bi_dev with password 'bi123';
create user data_engineer with password 'de123';

--Izin untuk akses schema SALAM
grant usage on schema SALAM to backend_dev, bi_dev, data_engineer;

--Role CRUD untuk backend_dev
create role role_crud;
grant select, insert, update, delete on all tables in schema SALAM to role_crud;
alter default privileges in schema SALAM grant select, insert, update, delete on tables to role_crud;
grant role_crud to backend_dev;

--Role read untuk bi_dev
create role role_read;
grant select on all tables in schema SALAM to role_read;
alter default privileges in schema SALAM grant select on tables to role_read;
grant role_read to bi_dev;

--Role CREATE, MODIFY, DROP, dan CRUD untuk data_engineer
create role role_admin;
grant all privileges on schema SALAM to role_admin;
grant all privileges on all tables in schema SALAM to role_admin;
alter default privileges in schema SALAM grant all on tables to role_admin;
grant role_admin to data_engineer;

--Tes Role di bi_dev
select * from salam.mahasiswas;
insert into salam.mahasiswas (nim, nama, email, jenis_kelamin, no_hp, jurusan)
values (
'1247050083',
'Linus Torvalds',
'1247050083@student.uinsgd.ac.id',
'L',
'08123454321',
'Teknik Informatika');
