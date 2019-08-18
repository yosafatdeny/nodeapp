const express = require('express')
const { rolesController } = require('../controllers')

const router = express.Router()

router.get('/getRoles', rolesController.getRoles)

module.exports = router