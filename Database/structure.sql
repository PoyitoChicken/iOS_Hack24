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


drop procedure if exists insert_log;

delimiter //
CREATE PROCEDURE insert_log( 	
    IN main_type VARCHAR(10),
    IN sub_type VARCHAR(10),
    in api_imageLink varchar(255),
    in api_location_x decimal(10,4),
    in api_location_y decimal(10,4)
)
BEGIN
    DECLARE get_report_type INT;
    
    SELECT id_report_type INTO get_report_type 
    FROM report_types
    WHERE report_type = main_type AND report_subtype = sub_type;
   insert into logs(id_report_type,report_date, image, location_x, location_y)
   values(get_report_type, now(), api_imageLink, api_location_x, api_location_y);
        
end //
DELIMITER ;

CREATE VIEW logs_api as 
SELECT rt.report_type,
rt.report_subtype,
la.report_date,
la.location_x,
la.location_y 
FROM logs la
INNER JOIN report_types rt on la.id_report_type = rt.id_report_type;
