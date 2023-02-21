import express from 'express'
import { checkAuth, checkUser } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')

//Recuperer tous les établissements d'un propriétaire
router.get("/etb/:id", checkAuth, etbController.getAllEtablissements)

//Ajouter un établissement 
router.post("/etb/add/:id", checkAuth, etbController.addEtb)



export = router