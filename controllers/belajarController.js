const conn = require('../database')
const moment    = require('moment')

module.exports={
    getBelajar: (req, res)=>{
        var idkelas = req.query.idkelas
        var iduser = req.query.iduser
        var qry = ''
        if(idkelas && iduser){
            qry = `WHERE k.idKelas = ${idkelas} && b.iduser = ${iduser}`
        }

        let sql = `SELECT b.*, k.idKelas
                        FROM belajar b
                        JOIN  modul m
                        ON b.idmodul = m.idmodul
                        JOIN kelas k
                        ON k.idKelas = m.idkelas
                        ${qry}`
        conn.query(sql, (err, result) =>{
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })

    },
    addBelajar: (req, res)=>{
        var data = req.body
        let sql = `INSERT INTO belajar SET ?`
        conn.query(sql, data, (err, result)=>{
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    }
}