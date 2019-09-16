const conn = require('../database')

module.exports={
    getLangganan : (req, res)=>{
        let qry=''
        console.log('langganan userid', req.query.userId)
        if(req.query.userId){
            qry = `where userId = ${req.query.userId} && status = 'active';`
        }
        var sql=`select * from langganan ${qry}`
        conn.query(sql, (err, result) => {
            if(err) return res.status(500).send({message: 'error', error: err})

            return res.status(200).send(result)
        })
    },
}