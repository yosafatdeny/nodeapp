const express = require('express')
const { kelaskuController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getKelasku', kelaskuController.getKelasku)
router.post('/addKelasku', kelaskuController.addKelasku)

module.exports = router