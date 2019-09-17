const conn = require('../database')
const moment    = require('moment')

module.exports={
    getKelasku: (req, res)=>{
        let sql = `SELECT * FROM kelasku`
        conn.query(sql, (err, result) =>{
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })

    },
    addKelasku: (req, res)=>{
        var data = req.body
        let sql = `INSERT INTO kelasku SET ?`
        conn.query(sql, data, (err, result)=>{
            if(err) return res.status(500).send({message: 'error', error: err})

            sql = `SELECT * FROM kelasku`
            conn.query(sql, (err, result) =>{
                if(err) return res.status(500).send({message: 'error', error: err})
                console.log('sukses bos', result)
                return res.status(200).send(result)
            })
        })
    }
}