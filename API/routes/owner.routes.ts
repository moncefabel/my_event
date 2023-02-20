import express from 'express'
const router:express.Router = express.Router()
const ownerController = require('../controllers/ownerController')
const authController = require('../controllers/authController')

//Recuperer tous les propriétaires
router.get("/proprios", ownerController.getAllOwners)

//Recuperer un propriétaire par son id
router.get("/proprios/:id", ownerController.getOwnerById)

//Créer un utilisateur
router.post("/register", authController.addUser)

//Modifier les informations d'un utilisateur
router.put("/update/:id", ownerController.updateOwner)

export = router