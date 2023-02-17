import express from "express"
const router:express.Router = express.Router();
const ownerController = require('../controllers/ownerController')

//Création d'un profil pour un propritétaire d'établissement
router.post("/register", ownerController.createAccountOwner)

//Recupérer tous les proprios 
router.get("/proprios", ownerController.getAllOwners)

//Recuperer un proprio par son id
router.get("/proprios/:id", ownerController.getOwnerById)

export = router