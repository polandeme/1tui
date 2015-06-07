var mysql = require('mysql');

var db = {};

db.connect = function() {
    var connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'tui',
        multipleStatements: true
    });
    connection.connect();
    return connection;
}

module.exports = db;