const express = require('express')
const { paketController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getPaket', paketController.getPaket)

module.exports = router