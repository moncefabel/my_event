import express from 'express'
import { checkProprio } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const authController = require('../controllers/authController')


router.post("/register", authController.addCustomer);
router.post("/signIn", authController.signInCustomer)

export = router