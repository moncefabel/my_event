import express from 'express'
import { checkUser } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const ownerController = require('../controllers/ownerController')
const authController = require('../controllers/authController')

//Recuperer tous les propriétaires
router.get("/proprios", ownerController.getAllOwners)

//Recuperer un propriétaire par son id
router.get("/proprios/:id", ownerController.getOwnerById)

//Créer un utilisateur
router.post("/register", authController.addProprio)

//Connexion d'un utilisateur
router.post("/signIn",authController.signInProprio )

//Déconnexion d'un utilisateur
router.post("/logOut",checkUser, authController.logOut)

//Modifier les informations d'un utilisateur
router.put("/update",checkUser, ownerController.updateOwner)

//Modification du mot de passe
router.put("/updatePassword/:id",checkUser, ownerController.changePassword)

//Supprimer un propriétaire
router.delete("/delete/:id",checkUser, ownerController.deleteOwner)

export = router