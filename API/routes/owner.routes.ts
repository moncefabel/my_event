import express from "express"
const router:express.Router = express.Router();
const ownerController = require('../controllers/ownerController')

//Création d'un profil pour un propritétaire d'établissement
router.post("/register", ownerController.createAccountOwner)

export = router