const conn = require('../database')
const Crypto = require('crypto')
const transporter = require('../helpers/mailer')
const { createJWTToken } = require('../helpers/jwt')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports={
    register: (req, res)=>{
        var { username, password, email} = req.body
        var sql = `SELECT username from users where username = '${username}' or email = '${email}'`
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).send({status: 'error', err})

            if(result.length > 0){
                return res.status(200).send({status: 'error', message: 'username or email has been taked'})
            }else{
                var hashPasswor = Crypto.createHmac("sha256", "marmutIjo")
                                        .update(password).digest("hex")
                
                var dataUser = {
                    username,
                    password: hashPasswor,
                    email,
                    active: 0,
                    roleId: 3,
                    createDate: new Date()
                }
            }

            sql = `INSERT into users SET ?`
            conn.query(sql, dataUser, (err1, res1)=>{
                if(err1) return res.status(500).send({status: 'error', err: err1})

                var linkVerifikasi = `http://localhost:3000/verified?username=${username}&password=${hashPasswor}`
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
    emailVerifikasi: (req,res) => {
        var { username, password } = req.body;
        console.log(req.body)
        var sql = `Select username,email from users where username='${username}'`;
        conn.query(sql, (err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })
            console.log('1')
            if(results.length === 0) {
                return res.status(500).send({ status: 'error', err: 'User Not Found!'})
            }
            console.log('2')

            sql = `Update users set active=1 where username='${username}' and password='${password}'`
            conn.query(sql, (err,results1) => {
                if(err) return res.status(500).send({ status: 'error', err })
                console.log('3')
                res.status(200).send({ username: results[0].username, email: results[0].email, status: 'Verified' })
            })
        })
    },
    resendEmailVer: (req,res) => {
        var { username, email } = req.body;

        var sql = `Select username,password,email from users where username='${username}' and email='${email}'`
        conn.query(sql, (err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })

            if(results.length === 0) {
                return res.status(500).send({ status: 'error', err: 'User Not Found!'})
            }

            var linkVerifikasi = `http://localhost:3000/verified?username=${results[0].username}&password=${results[0].password}`;
            var mailOptions = {
                from: 'Penguasa Instagrin <baronhartono@gmail.com>',
                to: results[0].email,
                subject: 'Verifikasi Email untuk Instagrin',
                html: `Tolong click link ini untuk verifikasi : 
                        <a href="${linkVerifikasi}">Join Instagrin!</a>`
            }

            transporter.sendMail(mailOptions, (err2,res2) => {
                if(err2) { 
                    console.log(err2) 
                    return res.status(500).send({ status: 'error', err: err2 })
                }
                
                console.log('Success!')
                return res.status(200).send({ username, email, status: 'Unverified' })
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
    getCurrentUser:(req, res) => {
        const {username} = req.params
        console.log('get params ===>', username)
        var sql = `select * from users where username = '${username}'`
        conn.query(sql, (err, results) => {
            if(err) return res.status(500).send({message: 'error', error: err})
            
            console.log('hasil get user ====>', results)
            return res.status(200).send(results)
        })
    },
    editUser:(req, res) => {
        var {username} = req.params.username;
        var sql = `select * from users where username = '${username}'`
        conn.query(sql, (err, results) => {
            if(err) throw err;

            if(results.length > 0){
                const path = '/user/images';
                const upload = uploader(path, 'POS').fields([{ name: 'image'}])

                upload(req, res, (err) => {
                    if(err){
                        return res.status(500).json({ message: 'Upload image user failed !', error: err.message });
                    }
    
                    const { image } = req.files;
                    // console.log(image)
                    const imagePath = image ? path + '/' + image[0].filename : null;
                    const data = JSON.parse(req.body.data);
    
                    try {
                        if(imagePath) {
                            data.image = imagePath;
                            
                        }
                        sql = `Update users set ? where username = ${username};`
                        conn.query(sql,data, (err1,results1) => {
                            if(err1) {
                                if(imagePath) {
                                    fs.unlinkSync('./public' + imagePath);
                                }
                                return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                            }
                            if(imagePath) {
                                fs.unlinkSync('./public' + results[0].image);
                            }
                            sql = `Select * from users where username=${req.user.username};`;
                            conn.query(sql, (err2,results2) => {
                                if(err2) {
                                    return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                                }

                                return res.status(200).send(results2);
                            })
                        })
                    }
                    catch(err){
                        console.log(err.message)
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                })
            }
        })
    },
    login: (req,res) => {
        var { email, password } = req.body;
        console.log(email, password)
        var hashPassword = Crypto.createHmac("sha256", "marmutIjo")
                                .update(password).digest("hex");
        var sql = `Select * from users where email='${email}' and password='${hashPassword}'`;
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
        // console.log('log-req ====>', req)
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