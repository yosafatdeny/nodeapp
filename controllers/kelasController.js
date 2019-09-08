const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')


module.exports ={
    getKelas: (req, res) => {
        var sql = `select k.*, c.name as category 
                        from kelas k 
                        join category c 
                        On c.idCategory = k.idKelas`
        conn.query(sql, (err, result) => {
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
                    sql = `SELECT * FROM kelas`
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
                    sql = `SELECT * from kelas where idKelas=${kelasId};`;
                    conn.query(sql, (err2,results2) => {
                        if(err2) {
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err2.message });
                        }
    
                        res.status(200).send(results2);
                    })
                })
            }
        })  
    },
}