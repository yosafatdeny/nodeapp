const express = require('express')
const {cartController} = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getCart', cartController.getCart)

module.exports = router




