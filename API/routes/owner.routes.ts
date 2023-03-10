import express from 'express'
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
router.post("/logOut",authController.logOut)

//Modifier les informations d'un utilisateur
router.put("/update/:id", ownerController.updateOwner)

//Modification du mot de passe
router.put("/updatePassword/:id", ownerController.changePassword)

//Supprimer un propriétaire
router.delete("/delete/:id", ownerController.deleteOwner)

export = router