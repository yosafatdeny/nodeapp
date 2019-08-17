const express   = require('express')
const cors      = require('cors')
const bodyparser= require('body-parser')
const moment    = require('moment')

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

// const { } = require('./routers')

app.listen(port, ()=> console.log(`Api aktif diport ${port}`))

var now = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
console.log(now) 

