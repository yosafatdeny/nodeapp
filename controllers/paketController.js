const conn = require('../database')

module.exports={
    getPaket : (req, res)=>{
        var sql='select * from paket'
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    }
}