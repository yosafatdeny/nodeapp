const express = require('express')
const { konfirmasiController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getKonfirmasi', konfirmasiController.getKonfirmasi)
router.post('/addKonfirmasi', auth, konfirmasiController.addKonfirmasi)
router.put('/konfirmasi/:id', konfirmasiController.konfirmasi)

module.exports = router