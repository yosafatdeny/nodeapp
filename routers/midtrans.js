const express = require('express')
const { midtrans } = require('../controllers')

const router = express.Router()

// router.get('/getRoles', rolesController.getRoles)
router.post('/midtrans', midtrans.getMidtrans)
router.post('/getStatus', midtrans.getStatus)
router.post('/gopay', midtrans.coreMidtrans)

module.exports = router