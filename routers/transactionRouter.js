const express = require('express')
const { transactionController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getTransaction', transactionController.getTransaction)
router.post('/addTransaction', auth, transactionController.addTransaction)
router.put('/confirmTransaction', transactionController.confirmTransaction)

module.exports = router