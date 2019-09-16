const express = require('express')
const { belajarController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getBelajar', belajarController.getBelajar)
router.post('/addBelajar', belajarController.addBelajar)

module.exports = router