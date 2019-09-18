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
                // var imagePath = `\sasa\sasas\sasas\sasa.png` '\users\images\user.png'
                
                var dataUser = {
                    username,
                    password: hashPasswor,
                    email,
                    active: 0,
                    roleId: 3,
                    createDate: new Date(),
                    image: "/user/user.png"
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
                    <a href="${linkVerifikasi}">Konfirmasi email</a>`
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
        // console.log(req.body)
        var sql = `Select username,email from users where username='${username}'`;
        conn.query(sql, (err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })
            // console.log('1')
            if(results.length === 0) {
                return res.status(500).send({ status: 'error', err: 'User Not Found!'})
            }
            // console.log('2')

            sql = `Update users set active=1 where username='${username}' and password='${password}'`
            conn.query(sql, (err,results1) => {
                if(err) return res.status(500).send({ status: 'error', err })
                // console.log('3')
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
                from    : 'Qiandra dari Qlas.com <lab.hisbu@gmail.com>',
                to      : email,
                subject : 'Verifikasi email user baru qlas.com',
                html    :  `Mohon untuk klik link dibawah ini untuk verifikasi email anda :
                <a href="${linkVerifikasi}">Konfirmasi email</a>`
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
        var sql = `select u.*, r.roleName as role 
                        from users u
                        join roles r
                        on u.roleId = r.id`
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).send({message: 'Error', error: err})
            // console.log(result)
            return res.status(200).send(result)
        })
    },
    getCurrentUser:(req, res) => {
        const {username} = req.params
        // console.log('get params ===>', username)
        var sql = `select * from users where username = '${username}'`
        conn.query(sql, (err, results) => {
            if(err) return res.status(500).send({message: 'error', error: err})
            
            // console.log('hasil get user ====>', results)
            return res.status(200).send(results)
        })
    },
    changePassword:(req, res) =>{
        var {username, oldPassword, newPassword, confirm}  = req.body
        console.log(req.body)
        var sql = `select * from users where username = '${username}'`
        conn.query(sql, (err, result)=>{
            if(err) return res.status(500).json({ message: 'user not found', error: err.message });

            var hashPassword = Crypto.createHmac("sha256", "marmutIjo")
                                        .update(oldPassword).digest("hex")
            
            if(result[0].password !== hashPassword){
                console.log('password salah')
                return res.status(200).send({status: 'error', message: 'Old password Incorrect'})
            }
            console.log(result)
            var hashPassword = Crypto.createHmac("sha256", "marmutIjo")
                                        .update(newPassword).digest("hex")
            const data = { password : hashPassword}
            sql = `update users set ? where username = '${username}'`
            conn.query(sql, data, (err1, result1)=>{
                if(err) res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });

                return res.status(200).send(result1)
            })
        })
    },
    editUser:(req, res) => {
        var {username} = req.params;
        console.log('edit user ======> ', username)
        var sql = `select * from users where username = '${username}'`
        conn.query(sql, (err, results) => {
            if(err) throw err;
            console.log('masuk disini - 1')
            if(results.length > 0){
                const path = '/user/images';
                const upload = uploader(path, 'USR').fields([{ name: 'image'}])
                console.log('masuk disini - 2')
                upload(req, res, (err) => {
                    if(err){
                        return res.status(500).json({ message: 'Upload image user failed !', error: err.message });
                    }
                    console.log('masuk disini - 3')
                    const { image } = req.files;
                    // console.log(image)
                    const imagePath = image ? path + '/' + image[0].filename : null;
                    console.log(imagePath)
                    const data = JSON.parse(req.body.data);
    
                    try {
                        if(imagePath) {
                            data.image = imagePath;
                            
                        }
                        sql = `Update users set ? where username = '${username}';`
                        conn.query(sql,data, (err1,results1) => {
                            if(err1) {
                                if(fs.existsSync(imagePath)) {
                                    fs.unlinkSync('./public' + imagePath);
                                }
                                console.log('masuk disini - 4')
                                return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                            }
                            if(imagePath) {
                                if(results[0].image !== '/user/user.png'){
                                    fs.unlinkSync('./public' + results[0].image);
                                }
                            }
                            console.log('req user ====> ', req.user)
                            sql = `Select * from users where username='${req.user.username}'`;
                            conn.query(sql, (err2,results2) => {
                                if(err2) {
                                    return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err2.message });
                                }
                                console.log('masuk disini - 5')
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
        // console.log(email, password)
        var hashPassword = Crypto.createHmac("sha256", "marmutIjo")
                                .update(password).digest("hex");
        var sql = `Select * from users where email='${email}' and password='${hashPassword}'`;
        conn.query(sql, (err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })

            if(results.length === 0) {
                return res.status(200).send({ status: 'error', message: 'Username or Password Incorrect!'})
            }
            const token = createJWTToken({ userId: results[0].id, username: results[0].username })
            // console.log(token)
            // console.log('ini ========> ', results[0].active)
            sql = `select l.*, p.durasi  
                            from langganan l 
                            join paket p 
                            on l.paketId = p.idpaket 
                            where userId = ${results[0].id}
                            && status='active'`
            // sql = `select * from langganan where userId = ${results[0].id} && status='active'`
            conn.query(sql, (err, resLangganan)=>{
                if(err) return res.status(500).send({ status: 'error', err })
                if(resLangganan.length === 0){
                    resLangganan = null
                }
                sql = `select kk.*, count(m.idmodul) as jumlahModul  
                            from kelasku kk
                            join modul m 
                            on  kk.kelasId = m.idkelas 
                            where userId = ${results[0].id}
                            group by kk.kelasId`
                conn.query(sql, (err, resKelasku)=>{
                    if(err) return res.status(500).send({ status: 'error', err })

                    sql = `select b.* , m.idkelas as kelasId
                                from belajar b
                                join modul m
                                on b.modulId = m.idmodul
                                where userId  = ${results[0].id}`

                    conn.query(sql, (err, resBelajar)=>{
                        if(err) return res.status(500).send({ status: 'error', err })
                        
                        sql = `select b.userId, count(b.modulId) as modulSelesai, m.idkelas as kelasId
                                    from belajar b
                                    join modul m
                                    on b.modulId = m.idmodul
                                    where userId = ${results[0].id}
                                    group by kelasId;`
                        conn.query(sql, (err, resModulSelesai) => {
                            if(err) return res.status(500).send({ status: 'error', err })
                            
                            return res.status(200).send({
                                userId      : results[0].id, 
                                username    : results[0].username, 
                                email       : results[0].email, 
                                status      : results[0].status, 
                                token, 
                                image       : results[0].image, 
                                roleId      : results[0].roleId, 
                                langganan   : resLangganan,
                                kelasku     : resKelasku,
                                belajar     : resBelajar,
                                modulSelesai: resModulSelesai
                            })
                        })
                    })
                })
            })
        })
    },
    keepLogin: (req,res) => { 
        // console.log('log-req ====>', req)
        // console.log('log-req.user ======>', req.user)
        var sql = `Select * from users where id=${req.user.userId}`
        conn.query(sql,(err,results) => {
            if(err) return res.status(500).send({ status: 'error', err })

            if(results.length === 0) {
                return res.status(500).send({ status: 'error', err: 'User Not Found!'})
            }

            const token = createJWTToken({ userId: results[0].id, username: results[0].username })
            sql = `select l.*, p.durasi  
                        from langganan l 
                        join paket p 
                        on l.paketId = p.idpaket 
                        where userId = ${req.user.userId} && status='active'`
            conn.query(sql, (err, resLangganan)=>{
                if(err) return res.status(500).send({ status: 'error', err })
                if(resLangganan.length === 0){
                    resLangganan = null
                }
                sql = `select kk.*, count(m.idmodul) as jumlahModul  
                            from kelasku kk
                            join modul m 
                            on  kk.kelasId = m.idkelas 
                            where userId = ${req.user.userId}
                            group by kk.kelasId`
                conn.query(sql, (err, resKelasku)=>{
                    if(err) return res.status(500).send({ status: 'error', err })

                    sql = `select b.* , m.idkelas as kelasId
                                from belajar b
                                join modul m
                                on b.modulId = m.idmodul
                                where userId = ${results[0].id}`
                    conn.query(sql, (err, resBelajar)=>{
                        if(err) return res.status(500).send({ status: 'error', err })
                        
                        sql = `select b.userId, count(b.modulId) as modulSelesai, m.idkelas as kelasId
                                    from belajar b
                                    join modul m
                                    on b.modulId = m.idmodul
                                    where userId = ${results[0].id}
                                    group by kelasId;`
                        conn.query(sql, (err, resModulSelesai) => {
                            if(err) return res.status(500).send({ status: 'error', err })
                            
                            return res.status(200).send({
                                userId      : results[0].id, 
                                username    : results[0].username, 
                                email       : results[0].email, 
                                status      : results[0].status, 
                                token, 
                                image       : results[0].image, 
                                roleId      : results[0].roleId, 
                                langganan   : resLangganan,
                                kelasku     : resKelasku,
                                belajar     : resBelajar,
                                modulSelesai: resModulSelesai
                            })
                        })
                    })
                })
            })
        })
    }
}