import express from 'express'
const router:express.Router = express.Router()
const ownerController = require('../controllers/ownerController')

router.get("/proprios", ownerController.getAllOwners)

// router.get("/proprios/:id", ownerController.getOwnerById)


export = router