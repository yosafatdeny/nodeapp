const express = require('express')
const { kelasController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();

router.get('/getKelas', auth, kelasController.getKelas)
router.post('/addKelas',auth, kelasController.addKelas)
router.delete('/deleteKelas/:id', auth, kelasController.deleteKelas) 
router.put('/editKelas/:id', auth, kelasController.editKelas)

module.exports = router