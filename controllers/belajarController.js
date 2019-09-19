const conn = require('../database')
const moment    = require('moment')

module.exports={
    getBelajar: (req, res)=>{
        var idkelas = req.query.idkelas
        var iduser = req.query.iduser
        var qry = ''
        if(idkelas && iduser){
            qry = `WHERE userId = ${iduser}`
        }

        let sql = `SELECT * FROM belajar ${qry}`
        conn.query(sql, (err, result) =>{
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })

    },
    addBelajar: (req, res)=>{
        var data = req.body
        console.log(data)
        var sql=`select * from belajar where modulId = ${data.modulId} && userId = ${data.userId}`
        conn.query(sql, (err, resultdata) =>{
            if(resultdata.length === 0){
                let sql = `INSERT INTO belajar SET ?`
                conn.query(sql, data, (err, result)=>{
                    if(err) return res.status(500).send({message: 'error', error: err})
        
                    sql =  `select * from belajar`
                    conn.query(sql, (err, result) =>{
                        if(err) return res.status(500).send({message: 'error', error: err})
                        
                        console.log('berhasil add')
                        return res.status(200).send(result)
                    })
                })
            }
            console.log('data sudah ada')
        })
    }
}