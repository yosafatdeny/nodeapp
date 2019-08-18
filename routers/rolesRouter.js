const express = require('express')
const { rolesController } = require('../controllers')

const router = express.Router()

router.get('/getRoles', rolesController.getRoles)
router.post('/addRole', rolesController.addRole)

module.exports = router