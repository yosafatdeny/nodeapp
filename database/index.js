require('dotenv').config();
const mysql = require('mysql')

const conn = mysql.createConnection({
    host    : process.env.NQ_DB_HOST,
    user    : process.env.NQ_DB_USER,
    password: process.env.NQ_DB_PASSWORD,
    database: process.env.NQ_DB_NAME,
    // port    : process.env.NQ_DB_PORT
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