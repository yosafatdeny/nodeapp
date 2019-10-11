const mysql = require('mysql')

const conn = mysql.createConnection({
    host    : 'localhost',
    user    : 'saitama',
    password: 'Pl163178149;',
    database: 'hisbu_dbqelas',
    port    : 3306

    
})

// const conn = mysql.createConnection({
//     host    : 'db4free.net',
//     user    : 'hisbu44',
//     password: 'P@ssw0rd.o1',
//     database: 'devapi'
// })



// const connection = mysql.createConnection({
//     host: 'db4free.net',
//     user: 'instagrinbaron',
//     password: 'incorrect197',
//     database: 'instagrinbaron',
//     port: 3306
// });

module.exports = conn