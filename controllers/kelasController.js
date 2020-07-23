const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

 
module.exports ={
    getKelas: (req, res) => {
        console.log('masuk kelas')
        var qry = ''
        console.log(req.query)
        if(req.query.idKelas){
            qry = `where k.idKelas = ${req.query.idKelas}`
        }
        var sql = `select k.*, c.name as category, count(m.idmodul) as jlmModul 
                        from kelas k 
                        join category c 
                        On c.idCategory = k.catId
                        join modul m
                        on k.idKelas = m.idkelas
                        ${qry}
                        group by m.idKelas;`
        // console.log(sql)
                               
        conn.query(sql, (err, result) => {
            console.log(err)
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    },
    addKelas: (req, res) => {
        try{
            const path = '/kelas/images'
            const upload = uploader(path, 'KLS').fields([{name: 'image'}])

            upload(req, res, (err)=>{
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }

                const { image } = req.files;
                const imagePath = image ? path + '/' + image[0].filename : null
                console.log(imagePath)

                const data = JSON.parse(req.body.data)
                data.image = imagePath
                 
                var sql = `INSERT INTO kelas SET ?`
                conn.query(sql, data, (err, result)=>{
                    if(err){
                        console.log(err.message)
                        fs.unlinkSync('./public'+imagePath)
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }

                    console.log(result)
                    sql = sql = `select k.*, c.name as category 
                                    from kelas k 
                                    join category c 
                                    On c.idCategory = k.catId`
                    conn.query(sql, (err, result1)=>{
                        if(err){
                            console.log(err.message);
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                        }
                        console.log(result1);
                        
                        return res.status(200).send(result1);
                    })
                })
            })
        } catch(err){
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }
    },
    deleteKelas: (req,res) => {
        var kelasId = req.params.id;
        var sql = `SELECT * from kelas where idKelas = ${kelasId};`;
        conn.query(sql, (err, results) => {
            if(err) {
                return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
            }
            
            if(results.length > 0) {
                sql = `DELETE from kelas where idKelas = ${kelasId};`
                conn.query(sql, (err1,results1) => {
                    if(err1) {
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                    }
    
                    fs.unlinkSync('./public' + results[0].image);
                    sql = sql = `select k.*, c.name as category 
                                    from kelas k 
                                    join category c 
                                    On c.idCategory = k.catId`
                    conn.query(sql, (err2,results2) => {
                        if(err2) {
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err2.message });
                        }
                        console.log(results2)
                        res.status(200).send(results2);
                    })
                })
            }
        })  
    },
    editKelas:(req, res) => {
        var idKelas = req.params.id;
        console.log('edit user ======> ', req.params.id, idKelas)
        var sql = `select * from kelas where idKelas = '${idKelas}'`
        conn.query(sql, (err, results) => {
            if(err) throw err;
            console.log('masuk disini - 1')
            if(results.length > 0){
                const path = '/kelas/images';
                const upload = uploader(path, 'KLS').fields([{ name: 'image'}])
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
                        sql = `Update kelas set ? where idKelas = '${idKelas}';`
                        conn.query(sql,data, (err1,results1) => {
                            if(err1) {
                                if(fs.existsSync(imagePath)) {
                                    fs.unlinkSync('./public' + imagePath);
                                }
                                console.log('masuk disini - 4')
                                return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err1.message });
                            }
                            if(imagePath) {
                                    fs.unlinkSync('./public' + results[0].image);
                            }
                            console.log('req user ====> ', req.user)
                            sql = sql = `select k.*, c.name as category 
                                            from kelas k 
                                            join category c 
                                            On c.idCategory = k.catId`
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
}