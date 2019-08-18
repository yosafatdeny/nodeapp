const conn = require('../database')

module.exports = {
    getRoles: (req, res)=>{
        var sql = `SELECT * FROM roles;`
        conn.query(sql, (err, result)=>{
            console.log(err)
            if(err) return res.status(500).send({message: 'Error!', error: err})
            console.log(result)
            return res.status(200).send(result)
        })
    }
    // addRole: (req, res)=>{
    //     try{

    //     }
    // }
}
