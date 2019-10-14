// const express   = require('express')
// const app = express()
// const cors      = require('cors')
// const bodyparser= require('body-parser')
// const moment    = require('moment')
// const Crypto    = require('crypto')
// const bearerToken  = require('express-bearer-token')
// const midtrransClient = require('midtrans-client')


// const http = require('http').createServer(app)

// const io = require('socket.io')(http, {
//     handlePreflightRequest: (req, res) => {
//         const headers = {
//             "Access-Control-Allow-Headers": "Content-Type, Authorization",
//             "Access-Control-Allow-Origin": req.headers.origin, //or the specific origin you want to give access to,
//             "Access-Control-Allow-Credentials": true
//         };
//         res.writeHead(200, headers);
//         res.end();
//     }
// })
// console.log(io)

// app.use(cors())
// app.use(bearerToken())
// //initial port
// const port = 2017
// //execute express



// //allow react access
// //get json from req.body
// app.use(bodyparser.json())
// app.use(bodyparser.urlencoded({extended: false}))
// //allow public dir for public access
// app.use(express.static('public'))


// app.io = io






// app.get('/',(req,res)=>{
//     res.status(200).send(`
//     <h1>Selamat datang di <b>Qlas rest-api</b></h1>
//     `)
// })

// const { 
//     usersRouter, 
//     rolesRouter, 
//     kelasRouter, 
//     cartRouter, 
//     paketRouter, 
//     transactionRouter,
//     konfirmasiRouter,
//     langgananRouter,
//     modulRouter,
//     belajarRouter,
//     kelaskuRouter,
//     midtrans
// } = require('./routers')

// app.use('/user', usersRouter)
// app.use('/role', rolesRouter)
// app.use('/kelas', kelasRouter)
// app.use('/cart', cartRouter)
// app.use('/paket', paketRouter)
// app.use('/transaction', transactionRouter)
// app.use('/konfirmasi', konfirmasiRouter)
// app.use('/langganan', langgananRouter)
// app.use('/modul', modulRouter)
// app.use('/belajar', belajarRouter)
// app.use('/kelasku', kelaskuRouter)
// app.use('/midtrans', midtrans)

// console.log('masuk io')
// io.on('connection', (socket) => {
//         console.log('User connected')
//         io.emit('user connected', {})
//         socket.on('disconnect', () => {
//                 console.log('user disconnected')
//                 io.emit('user connected', {})
//         })
// })

// var now = moment().format("dddd, MMMM Do YYYY, h:mm:ss a")
// var test = moment().add(30, 'day').format("YYYY-MM-DD h:mm:ss")
// console.log(test)
// console.log(now) 

// http.listen(port, ()=> console.log(`Api aktif diport ${port}`))

 


const app = require('express')()
const http = require('http').createServer(app)
const port = 2017
const io = require('socket.io')(http)
const bodyParser = require('body-parser')
const cors = require('cors')

app.use(bodyParser.json())
app.use(cors())

var arrayMsg = []
var userCount = 0

app.io = io
app.arrayMsg = arrayMsg
app.userCount = userCount

app.get('/', function(req, res){
    res.send('<h1>socket api </h1>');
});

// const { chatRouter } = require('./Router')

// app.use('/chat', chatRouter)

io.on('connection', function(socket){
    console.log('User Connected')
    userCount += 1
    io.emit('user connected' , userCount)

    socket.on('disconnect', () => {
        console.log('user disconnected')
        userCount --
        io.emit('user connected', userCount)
    })
})


http.listen(port, () => {
    console.log('listen on port ' + port)
})