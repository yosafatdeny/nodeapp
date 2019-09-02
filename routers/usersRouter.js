const express = require('express')
const { userController} = require('../controllers')
const { auth } = require('../helpers/auth')

const router = express.Router()

router.get('/getUsers', userController.getUsers)
router.post('/login', userController.login)
router.post('/keeplogin', auth, userController.keepLogin)
 
module.exports = router