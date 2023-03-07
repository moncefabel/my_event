import express from 'express'
import { checkAuth, checkUser } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')

//Recuperer tous les établissements d'un propriétaire
router.get("/allEtb/:id", checkAuth, etbController.getAllEtablissements)

//Ajouter un établissement 
router.post("/add", etbController.addEtb)

//Modifier les informations d'un établissement
router.put("/update/:id", checkAuth, etbController.updateEtb)

//Supprimer un établissement
router.delete("/delete/:idEtb",checkAuth, etbController.deleteEtb)


export = router