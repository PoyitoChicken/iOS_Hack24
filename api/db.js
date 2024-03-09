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
