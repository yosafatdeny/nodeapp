const conn = require('../database')
const transporter = require('../helpers/mailer')
const moment    = require('moment')

module.exports={
    getModul: (req, res)=>{
        var idkelas = req.query.idkelas
        // console.log(idkelas)
        var qry = ''
        if(idkelas){
            qry = `&& m.idkelas = ${idkelas}`
        }

        let sql = `SELECT m.*, k.kelasName as nama 
                        FROM modul m
                        JOIN kelas k
                        on m.idkelas = k.idKelas
                        where isDeleted = 0
                        ${qry}`
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    },
    addModule: (req, res)=>{
        var data = req.body
        // console.log('data kesatu ===>', data)
        // data.isDeleted = 0
        console.log(data)
        let sql = `INSERT INTO modul SET ?`
        conn.query(sql, data, (err, resInsert)=>{
            if(err) return res.status(500).send({message: 'error', error: err})

            let sql = `SELECT m.*, k.kelasName as nama 
                            FROM modul m
                            JOIN kelas k
                            on m.idkelas = k.idKelas
                            where isDeleted = 0`
            conn.query(sql, (err, result) => {
                if(err) return res.status(500).send({message: 'error', error: err})
                console.log(result)
                return res.status(200).send(result)
            })
        })
    },
    editModul:(req, res)=>{
        var idmodul = req.query.idmodul
        var sql = `SELECT * FROM modul where idmodul = ${idmodul}`
        conn.query(sql, (err, resModul)=>{
            if(err) return res.status(500).send({message: 'error', error: err})
            
            if(resModul.length > 0){
                const data = req.body
                sql = `UPDATE modul set ? where idmodul = ${idmodul}`
                conn.query(sql, data, (err, resUpdate) =>{
                    if(err) return res.status(500).send({message: 'error', error: err})

                    let sql = `SELECT m.*, k.kelasName as nama 
                            FROM modul m
                            JOIN kelas k
                            on m.idkelas = k.idKelas
                            where isDeleted = 0`
                    conn.query(sql, (err, result) => {
                        if(err) return res.status(500).send({message: 'error', error: err})

                        return res.status(200).send(result)
                    })

                })
            }
        })
    },
    deleteModul:(req,res) =>{
        var idmodul = req.query.idmodul
        var sql = `SELECT * FROM modul where idmodul = ${idmodul}`
        conn.query(sql, (err, resModul)=>{
            if(err) return res.status(500).send({message: 'error', error: err})
            
            if(resModul.length > 0){
                const data = {
                    isDeleted : 1
                }
                sql = `UPDATE modul set ? where idmodul = ${idmodul}`
                conn.query(sql, data, (err, resUpdate) =>{
                    if(err) return res.status(500).send({message: 'error', error: err})

                    let sql = `SELECT m.*, k.kelasName as nama 
                            FROM modul m
                            JOIN kelas k
                            on m.idkelas = k.idKelas
                            where isDeleted = 0`
                    conn.query(sql, (err, result) => {
                        if(err) return res.status(500).send({message: 'error', error: err})

                        return res.status(200).send(result)
                    })

                })
            }
        })
    }
}