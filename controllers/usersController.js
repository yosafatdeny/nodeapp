const conn = require('../database')
const Crypto = require('crypto')
const transporter = require('../helpers/mailer')
const { createJWTToken } = require('../helpers/jwt')

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
                    email,
                    active: 'Unverified',
                    createDate: new Date()
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

    },
    getUsers: (req,res) =>{
        var sql = `select * from users`
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).send({message: 'Error', error: err})
            console.log(result)
            return res.status(200).send(result)
        })
    },
    login: (req,res) => {
        var { email, password } = req.body;
        console.log(email, password)
        var hashPassword = Crypto.createHmac("sha256", "puripuriprisoner")
                                .update(password).digest("hex");
        var sql = `Select * from users where email='${email}' and passowrd='${password}'`;
        conn.query(sql, (err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })

            if(results.length === 0) {
                return res.status(200).send({ status: 'error', message: 'Username or Password Incorrect!'})
            }
            const token = createJWTToken({ userId: results[0].id, username: results[0].username })
            console.log(token)
            console.log(results)
            return res.status(200).send({ username: results[0].username, email: results[0].email, status: results[0].status, token})
            // return res.status(200).send({ username:results[0].username, email: results[0].email, status: results[0].status})
        })
    },
    keepLogin: (req,res) => {
        console.log('log-req ====>', req)
        console.log('log-req.user ======>', req.user)
        var sql = `Select * from users where id=${req.user.userId}`
        conn.query(sql,(err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })

            if(results.length === 0) {
                return res.status(500).send({ status: 'error', err: 'User Not Found!'})
            }

            const token = createJWTToken({ userId: results[0].id, username: results[0].username })

            res.send({ username: results[0].username, email: results[0].email, status: results[0].status, token})
        })
    }
}