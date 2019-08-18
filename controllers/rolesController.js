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
    },
    addRole: (req, res)=>{
        try{
            console.log(req.body)
            var data = req.body
            var sql = `INSERT INTO roles SET ?`
            conn.query(sql, data, (err, results)=>{
                if(err) return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });

                console.log(results)
                sql = `SELECT * FROM roles;`
                conn.query(sql, (err, result2)=>{
                    if(err) return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message })

                    console.log(result2)
                    return res.status(200).send(result2)
                })
            })
        }catch(err){
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message })
        }
    }
}
