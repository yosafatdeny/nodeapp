const express = require('express')
const { langgananController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getLangganan', auth,  langgananController.getLangganan)

module.exports = router