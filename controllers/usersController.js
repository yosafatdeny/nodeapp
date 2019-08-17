const conn = require('../database')
const Crypto = require('crypto')
const transporter = require('../helpers/mailer')

module.exports={
    register: (req, res)=>{
        var { username, password, email} = req.body
        var sql = `SELECT username from users where username = '${username}'`
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).send({status: 'error', err})

            if(result.length > 0){
                return res.send(200).send({status: 'error', message: 'username has been taked'})
            }else{
                var hashPasswor = Crypto.createHmac("sha256", "marmutIjo")
                                        .update(password).digest("hex")
                
                var dataUser = {
                    username,
                    password: hashPasswor,
                    firstName,
                    lastName,
                    gender,
                    email,
                    phone,
                    address,
                    roleId,
                    active: 'Unverified',
                    createDate: new Date(),
                    lastUpdate: new Date(),
                    lastlogin: new Date()
                }
            }

            sql = `INSERT into users SET ?`
            conn.query(sql, dataUser, (err1, res1)=>{
                if(err1) return res.status(500).send({status: 'error', err: err1})

                var linkVerivikasi = `http://localhost:3000/verified?username=${username}&password=${hashPasswor}`
                var mailOptions = {
                    from    : 'Qiandra dari Qlas.com <lab.hisbu@gmail.com>',
                    to      : email,
                    subject : 'Verifikasi email user baru qlas.com',
                    html    :  `Mohon untuk klik link dibawah ini untuk verifikasi email anda :
                    <a href="${linkVerifikasi}">Join Instagrin</a>`
                }

                transporter.sendMail(mailOptions, (err2, res2)=>{
                    if(err2){
                        console.log(err2)
                        return res.status(500).send({status: 'error', err: err2})
                    }
                    console.log('SUccess')
                    return res.status(200).send({username, email, status: 'Unverivied'})
                })
                
            })
        })

    }
}