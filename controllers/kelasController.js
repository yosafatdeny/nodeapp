const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports ={
    getKelas: (req, res) => {
        var sql = `select * from kelas`
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    }
}