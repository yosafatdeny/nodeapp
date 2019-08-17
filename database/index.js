const mysql = require('mysql')

const connection = mysql.createConnection({
    host    : 'localhost',
    user    : 'hisbu',
    password: 'password123',
    database: 'dbqelas',
    port    : 3306
})

module.exports = connection