import express from 'express'
const router:express.Router = express.Router()
const ownerController = require('../controllers/ownerController')
const authController = require('../controllers/authController')
router.get("/proprios", ownerController.getAllOwners)

router.get("/proprios/:id", ownerController.getOwnerById)

router.post("/register", authController.addUser)

export = router