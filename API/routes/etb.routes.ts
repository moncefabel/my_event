import express from 'express'
import {checkUser } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')

//Recuperer tous les établissements d'un propriétaire
router.get("/allEtb", checkUser,etbController.getAllEtablissements)

router.get("/etb",etbController.getEtbById)
//Ajouter un établissement 
router.post("/add", checkUser,etbController.addEtb)

//Modifier les informations d'un établissement
router.put("/update", checkUser,etbController.updateEtb)

//Supprimer un établissement
router.post("/delete",checkUser, etbController.deleteEtb)

router.get("/etbs", etbController.getEtbByPlace)



export = router