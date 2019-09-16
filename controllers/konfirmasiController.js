const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')
const transporter = require('../helpers/mailer')
const moment    = require('moment')
const {confirmTransaction} = require('./transactionController')

module.exports={
    getKonfirmasi: (req, res)=>{
        var sql =`SELECT * FROM konfirmasi`;
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)

        })
    },
    addKonfirmasi:(req, res)=>{
        try{
            const path = '/konfirmasi/images'
            const upload = uploader(path, 'KONF').fields([{name: 'image'}])

            upload(req, res, (err)=>{
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }

                const { image } = req.files;
                const imagePath = image ? path + '/' + image[0].filename : null
                console.log(imagePath)
                // const imagePath='/konfirmasi/image/image.jpg'
                const data = JSON.parse(req.body.data)
                data.image = imagePath
                data.status = 'unverified'
                 
                var sql = `INSERT INTO konfirmasi SET ?`
                conn.query(sql, data, (err, result)=>{
                    if(err){
                        console.log(err.message)
                        fs.unlinkSync('./public'+imagePath)
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }

                    console.log(result)
                    return res.status(200).send(result);
                
                })
            })
        } catch(err){
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }
    },
    konfirmasi:(req, res)=>{
        var id = req.params.id
        var sql = `SELECT * FROM konfirmasi where idkonfirmasi = ${id}`
        conn.query(sql, (err, resKonfirmasi)=>{
            if(err) return res.status(500).send({message: 'error', error: err})

            let verified = { status: 'verified'}
            if(resKonfirmasi.length > 0){
                sql=`UPDATE konfirmasi set ? where idkonfirmasi = ${id}`
                conn.query(sql, verified, (err, result1)=>{
                    if(err) return res.status(500).send({message: 'error', error: err})
                    
                    // ================ UPDATE TABEL TRANSAKSI ============================
                    var invoice = resKonfirmasi[0].invoice
                    console.log(req.body)
                    var sql = `select * from transaction where invoice= '${invoice}'`
                    conn.query(sql, (err, resTransaksi)=>{
                        if(err){
                            console.log(err)
                            return res.status(500).send({message: 'error', error: err})
                        }
                        var verified={ status:'verified'}
                        if(resTransaksi.length > 0){
                            sql=`UPDATE transaction set ? where invoice = '${invoice}'`
                            conn.query(sql, verified, (err, result2) =>{
                                if(err){
                                    return res.status(500).send({status: 'error', err: err})
                                }

                                // ================ INSERT TABEL LANGGANAN ============================
                                sql = `SELECT durasi FROM paket where idpaket = ${resTransaksi[0].paketId}`
                                conn.query(sql, (err, resPaket)=>{
                                    if(err){
                                        return res.status(500).send({status: 'error', err: err})
                                    }

                                    // return res.status(200).send(resPaket)

                                    var durasi = resPaket[0].durasi
                                    var start = moment().format("YYYY-MM-DD h:mm:ss")
                                    var end = moment().add(durasi, 'day').format("YYYY-MM-DD h:mm:ss")
                                    var dataLangganan = {
                                        userId: resTransaksi[0].userId,
                                        paketId: resTransaksi[0].paketId,
                                        awalLangganan : start,
                                        akhirLangganan: end,
                                        status: 'active'
                                    }
                                    sql=`INSERT INTO langganan SET ?`
                                    conn.query(sql, dataLangganan, (err3, result3)=>{
                                        if(err3){
                                            return res.status(500).send({status: 'error', err: err3})
                                        }
                                        
                                        console.log(`data langganan berhasil di proses`)
                                        console.log(result3)

                                        sql=`SELECT * FROM konfirmasi`
                                        conn.query(sql, (err, konfirmasiData)=>{
                                            if(err3){
                                                return res.status(500).send({status: 'error', err: err3})
                                            }

                                            return res.status(200).send(konfirmasiData)
                                        })
                                        // return res.status(200).send(result3)
                                    })
    
                                    // console.log(`transaction id ${idtransaction} verified`)
                                    // console.log(result)
                                    console.log('success')
                                })
                                // return res.status(200).send(result1)
                            }) 
                        }
                    })

                })
            }
        })
    }
}