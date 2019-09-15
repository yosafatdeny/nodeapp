const express   = require('express')
const cors      = require('cors')
const bodyparser= require('body-parser')
const moment    = require('moment')
const Crypto    = require('crypto')
const bearerToken  = require('express-bearer-token')

//initial port
const port = 2017
//execute express
const app = express()
//allow react access
app.use(cors())
app.use(bearerToken())
//get json from req.body
app.use(bodyparser.json())
app.use(bodyparser.urlencoded({extended: false}))
//allow public dir for public access
app.use(express.static('public'))

app.get('/',(req,res)=>{
    res.status(200).send(`
    <h1>Selamat datang di <b>Qlas rest-api</b></h1>
    `)
})

const { 
    usersRouter, 
    rolesRouter, 
    kelasRouter, 
    cartRouter, 
    paketRouter, 
    transactionRouter,
    konfirmasiRouter
} = require('./routers')

app.use('/user', usersRouter)
app.use('/role', rolesRouter)
app.use('/kelas', kelasRouter)
app.use('/cart', cartRouter)
app.use('/paket', paketRouter)
app.use('/transaction', transactionRouter)
app.use('/konfirmasi', konfirmasiRouter)



app.listen(port, ()=> console.log(`Api aktif diport ${port}`))
var now = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
var test = moment().add(30, 'day').format("YYYY-MM-DD h:mm:ss")
console.log(test)
console.log(now) 
 
