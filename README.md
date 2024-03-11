# iOS Hack MTY 2024
## Problem
In order to find a new way to make innovative solutions for the SDGs by UNO, specifically 6 Clean Water and Sanitation, 7 Affordable and Clean Energy, 13 Climate Action, 14 Life Below Water, 15 Life on Land, plan and develop an iOS app that makes the people feel more engaged with taking care of planet Earth

## Solution
A problem that affects the entire world, specifically Mexico is pollution of every kind, Monterrey and CDMX are within the cities with the worst air quality in the world, but not only that, the vast majority of people leave their trash on the ground, even in protected natural areas, I've gone on a lot of hike in the surroundings of Monterrey and there's not a single mountain that doesn't have a spot with lots of plastics, cans, clothes and even items of personal use.

And that lead us to design phone app that connects its users with each other, but not only that, with the corresponding authorities and organizations that take care of the planet, and the people, such as firefighters, police, CFE, "Agua y Drenaje", and more NGOs. You can make a report by simply clicking the "photo" button in the app and our AI determines what type of problem it is, and automatically sends the respective authority a notification/report so they can take care of it.

Not only that but since everything stems from childhood, it also has a section that teaches kids not to contaminate by showing them what's happening to the world right now and how it's already affecting us through infographs.

### 1. UI/UX
main > appUXUI > Complete
* https://github.com/marthamendozaa
* https://github.com/marielperezf

### 2. CoreML development
main > app > MLTest.mlproj
* https://github.com/marthamendozaa
* https://github.com/marielperezf
* https://github.com/PoyitoChicken

### 3. Datasets used
main > #datasets
* https://github.com/marthamendozaa
* https://github.com/marielperezf
* https://github.com/PoyitoChicken

### 4. CoreML integration
main > APP > TestML > TestML > MLModel
* https://github.com/PoyitoChicken

### 5. API
frameworks express, mysql2, fs
main > api
* https://github.com/PoyitoChicken


#### a. router
main > api > routes.js
```
router.get('/api/getLogs/', controller.getLogs);
router.post('/api/postLogs/', controller.postLogs);
```

#### b. controller
main > api > controller.js
```
class MainController {
  async postLogs(req, res){
    //handle db insertion
  }
  async getLogs(req,res){
    //handle query
  }
}
```

#### c. mysql connection initializer
main > api > db.js
```
const mysql = require('mysql2')
require('dotenv').config()
// Create a connection to the database
const USER = process.env.USER
const PASSWORD = process.env.PASSWORD
const HOST = process.env.HOST
const DATABASE = process.env.DATABASE
const connection = mysql.createConnection({
    host: HOST,
    user: USER,
    password: PASSWORD,
    database: DATABASE
  });

// open the MySQL connection
connection.connect(error => {
    if (error) throw error;
    console.log("Successfully connected to the database.");
});

module.exports = connection;
```

### 6. Server-Database
main > Database
AWS ec2 instance running the API and database in mysql
* https://github.com/PoyitoChicken
Snippet 
```
drop database if exists IOSHack24;

create database IOSHack24;

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
```
