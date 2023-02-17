import express from "express"
const router:express.Router = express.Router();
const ownerController = require('../controllers/ownerController')
const authController = require('../controllers/authController')


//Création d'un profil pour un propritétaire d'établissement
router.post("/register", ownerController.createAccountOwner)

//Connexion d'un profil propriétaire
router.post("/signIn",authController.signIn)

//Déconnexion d'un propriétaire
router.post("/signOut",authController.logOut)

//Recupérer tous les proprios 
router.get("/proprios", ownerController.getAllOwners)

//Recuperer un proprio par son id
router.get("/proprios/:id", ownerController.getOwnerById)

export = router