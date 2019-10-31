// const midtransClient = require('midtrans-client');
// const moment    = require('moment')

// const snap = new midtransClient.Snap({
//     isProduction : false,
//     serverKey : 'SB-Mid-server-Dr8HK_lJ4cuEZi4rUgNcsDUR',
//     clientKey : 'SB-Mid-client-Ttge99xVU4AOz44T'
// })

// const core = new midtransClient.CoreApi({
//     isProduction : false,
//     serverKey : 'SB-Mid-server-Dr8HK_lJ4cuEZi4rUgNcsDUR',
//     clientKey : 'SB-Mid-client-Ttge99xVU4AOz44T'

// })


// module.exports={
//     getMidtrans : (req, res)=>{
//         var {order_id, gross_amount} = req.body
//         console.log('masuk midtrans')
//         console.log(req.body)
//         console.log(order_id, gross_amount)

//         var randDate = moment().format("YYMMDD")
//         var randInt = Math.floor(Math.random()*(999-100+1)+100)

        

//         let parameter = {
//             "transaction_details": {
//                 "order_id": order_id,
//                 "gross_amount": gross_amount
//             }
//         }

//         let transactionToken=''
//         snap.createTransaction(parameter)
//         .then((transaction)=>{
//             transactionToken = transaction.token;
//             console.log('transactionToken: ', transactionToken)
//             return res.status(200).send({transactionToken, order_id: parameter.transaction_details.order_id})
//         })        
//     },
//     getStatus:(req,res)=>{
        
//         const {order_id} = req.body
//         console.log('========masuk getStatus =============')
//         console.log(order_id)

//         snap.transaction.status(order_id)
//         .then((Response)=>{
//             console.log('=======masuk status=========')
//             console.log(Response)
//             let status = {
//                 order_id : Response.order_id,
//                 transaction_status : Response.transaction_status
//             }
//             req.app.io.emit('status_transaction', status)
//             console.log(Response)
//             mockNotificationJson = Response     
//             snap.transaction.notification(Response)
//                 .then((statusResponse)=>{
//                     console.log('=======masuk notification=========')
//                     console.log(statusResponse)

//                     let orderId = statusResponse.order_id
//                     let transactionStatus = statusResponse.transaction_status
//                     let fraudStatus = statusResponse.fraud_status

//                     let msg = `Transaction notification received. Order ID: ${orderId}. Transaction status: ${transactionStatus}. Fraud status: ${fraudStatus}`

//                     if(transactionStatus == 'settlement'){
//                         console.log(transactionStatus)
//                         if(fraudStatus == 'challenge'){
//                             console.log(fraudStatus)
//                             return res.status(200).send(msg)
//                         }else if(fraudStatus == 'accept'){
//                             console.log(fraudStatus)
//                             return res.status(200).send(msg)
//                         }
//                     }else if(transactionStatus == 'cancel' || transactionStatus == 'failure'){
//                         console.log(transactionStatus)
//                         return res.status(200).send(msg)
//                     }else if(transactionStatus == 'pending'){
//                         console.log(transactionStatus)
//                         return res.status(200).send(msg)
//                     }
//                 })      
//             })
//     },

//     success: (req, res) => {
//         console.log(req.body.data)
//         return res.status(200).send(req.body.data)
//     },

//     coreMidtrans:(req, res)=>{
//         const { parameter } = req.body
//         console.log('====== masuk core api')
      
//         console.log(parameter)
//         core.charge(parameter)
//             .then((chargeResponse)=>{
//                 console.log('chargeResponse: ', JSON.stringify(chargeResponse));
//                 return res.status(200).send(chargeResponse)
                
//             }).catch((e)=>{
//                 console.log('Error occured: ', e.message)
//             })
         
//     }
// }