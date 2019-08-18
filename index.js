const express   = require('express')
const cors      = require('cors')
const bodyparser= require('body-parser')
const moment    = require('moment')
const Crypto    = require('crypto')

//initial port
const port = 2017
//execute express
const app = express()
//allow react access
app.use(cors())
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

const { usersRouter, rolesRouter } = require('./routers')

app.use('/user', usersRouter)
app.use('/role', rolesRouter)

app.listen(port, ()=> console.log(`Api aktif diport ${port}`))

var now = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
console.log(now) 

