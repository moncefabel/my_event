import express from 'express'
import { checkAuth } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const ownerController = require('../controllers/ownerController')
const authController = require('../controllers/authController')

//Recuperer tous les propriétaires
router.get("/proprios", ownerController.getAllOwners)

//Recuperer un propriétaire par son id
router.get("/proprios/:id", ownerController.getOwnerById)

//Créer un utilisateur
router.post("/register", authController.addUser)

//Connexion d'un utilisateur
router.post("/signIn",authController.signIn )

//Déconnexion d'un utilisateur
router.post("/logOut",authController.logOut)

//Modifier les informations d'un utilisateur
router.put("/update/:id",checkAuth, ownerController.updateOwner)

//Modification du mot de passe
router.put("/updatePassword/:id", checkAuth, ownerController.changePassword)

//Supprimer un propriétaire
router.delete("/delete/:id",checkAuth, ownerController.deleteOwner)

export = router