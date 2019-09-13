const conn = require('../database')

module.exports ={
    getCart: (req, res) => {
        var qry = ''
        if(req.query.userId){
            qry = `where userId = ${req.query.userId}`
        }
        var sql = `select c.*, k.kelasName as nama, k.price as harga
                        from cart c
                        join kelas k
                        On c.kelasId = k.idKelas
                        ${qry};`
                               
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    },
}