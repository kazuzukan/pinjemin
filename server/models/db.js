const mysql = require('mysql');
//Connect to local connection
const connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'pinjemindb' 
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("Database Connected!");
});

module.exports = connection;