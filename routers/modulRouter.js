const express = require('express')
const { modulController } = require('../controllers')
const { auth } = require('../helpers/auth')
const router = express.Router();


router.get('/', (req, res) =>
  res.status(200).json({
    message: '/Booking Order path',
  }),
);

router.get('/getModul', modulController.getModul)
router.post('/addModul', modulController.addModule)
router.put('/editModul',  modulController.editModul) 
router.put('/deleteModul',  modulController.deleteModul)

module.exports = router