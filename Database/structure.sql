drop database if exists IOSHack24;

create database IOSHack24;
/*
create user 'ios'@'localhost' IDENTIFIED by 'e7letsgo';
grant all privileges on *.* to 'ios'@'localhost' with grant option;
flush privileges;
*/
use IOSHack24;


create table report_types (
	id_report_type int primary key auto_increment not null,
	report_type enum('Suelo','Agua','Aire'),
	report_subtype enum('Basura','Derrame','Fuga','Refineria','Incendio'),
	actions_fyi varchar(255),
	contact varchar(255)
);

create table logs(
	id_log int primary key auto_increment not null,
	id_report_type int not null,
	report_date timestamp,
	image varchar(255),
	name varchar(50),
	location_x decimal(10,4),
	location_y decimal(10,4),
	foreign key (id_report_type) references report_types(id_report_type)
);

insert into report_types(report_type, report_subtype, actions_fyi, contact)
values
('Suelo', 'Basura','idk contact someone' ,'contact'),
('Agua','Basura','idk contact someone' ,'contact'),
('Agua','Derrame','idk contact someone' ,'contact'),
('Agua','Fuga','idk contact someone' ,'contact'),
('Aire','Refineria','idk contact someone' ,'contact'),
('Aire','Incendio','idk contact someone' ,'contact');


select * from report_types;
