const conn = require('../database')
const transporter = require('../helpers/mailer')
const moment    = require('moment')
module.exports={
    getTransaction: (req, res)=>{
        var qry=''
        if(req.query.idtransaction){
            qry = `where idtransaction = ${req.query.idtransaction}`
        }
        var sql = `select t.*, p.durasi, p.harga, u.username as NamaUser
                        from transaction t
                        join paket p
                        on t.paketId = p.idpaket
                        join users u
                        on t.userId = u.id
                        ${qry};`
        
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    },
    addTransaction:(req, res)=>{
        console.log('masuk sinih')
        console.log('body=======>',req.body)
        var saja={nama:'aaanama', juga:'apa'}
        // var c= JSON.stringify(saja)
        // var  data1 = JSON.parse(req.body.data)
        // console.log(data1)
        var {userId, paketId, durasi, harga, email} = req.body
        var date = moment().format("YYYY-MM-DD, h:mm:ss ")
        var randDate = moment().format("YYMMDD")
        var randInt = Math.floor(Math.random()*(999-100+1)+100)
        var transData = {
            invoice:`QLS${durasi}${randDate}${randInt}`,
            userId: userId,
            paketId: paketId,
            harga: harga+randInt,
            date: date,
            status:'Unverified'
        }
        console.log('transData===>',transData)

        var sql = `INSERT INTO transaction SET ?`
        conn.query(sql, transData, (err, result)=>{
            if(err) return res.status(500).send({status: 'error', err: err})
            
            // var linkInvoice = `http://localhost:3000/verified?username=${username}&password=${hashPasswor}`
                var mailOptions = {
                    from    : 'Qiandra dari Qlas.com <lab.hisbu@gmail.com>',
                    to      : email,
                    subject : 'Verifikasi email user baru qlas.com',
                    html    :  `Mohon untuk klik link dibawah ini untuk verifikasi email anda :`
                    // <a href="${linkVerifikasi}">Join Instagrin</a>`
                }
                transporter.sendMail(mailOptions, (err2, res2)=>{
                    if(err2){
                        console.log(err2)
                        return res.status(500).send({status: 'error', err: err2})
                    }

                    sql=`SELECT * FROM transaction where idtransaction = ${result.insertId}`
                    conn.query(sql, (err, resData)=>{
                        if(err){
                            console.log(err2)
                            return res.status(500).send({status: 'error', err: err2})
                        }

                        console.log('result===>',resData)
                        return res.status(200).send(resData)
                    })
                })
        })

    },
    confirmTransaction:(req, res)=>{
        console.log(req.query.id)
        var idtransaction = req.query.id
        var {durasi} = req.body
        console.log(req.body)
        var sql = `select * from transaction where idtransaction= ${idtransaction}`
        conn.query(sql, (err, result)=>{
            if(err){
                console.log(err)
                return res.status(500).send({message: 'error', error: err})
            }
            var verified={ status:'verified'}
            if(result.length > 0){
                sql=`UPDATE transaction set ? where idtransaction = ${idtransaction}`
                conn.query(sql, verified, (err, result1) =>{
                    if(err){
                        return res.status(500).send({status: 'error', err: err})
                    }
                    var start = moment().format("YYYY-MM-DD h:mm:ss")
                    var end = moment().add(durasi, 'day').format("YYYY-MM-DD h:mm:ss")
                    var dataLangganan = {
                        userId: result[0].userId,
                        paketId: result[0].paketId,
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
                        return res.status(200).send(result3)
                    })

                    console.log(`transaction id ${idtransaction} verified`)
                    console.log(result)
                    // return res.status(200).send(result1)
                }) 
            }
        })
    }
}