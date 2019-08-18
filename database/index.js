const mysql = require('mysql')

const conn = mysql.createConnection({
    host    : 'localhost',
    user    : 'hisbu',
    password: 'password123',
    database: 'dbqelas',
    port    : 3306

    
})


// const connection = mysql.createConnection({
//     host: 'db4free.net',
//     user: 'instagrinbaron',
//     password: 'incorrect197',
//     database: 'instagrinbaron',
//     port: 3306
// });

module.exports = conn