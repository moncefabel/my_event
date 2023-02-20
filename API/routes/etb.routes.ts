import express from 'express'
import { checkAuth } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')

//Recuperer tous les établissements d'un propriétaire
router.get("/proprios/etablissements/:id", checkAuth, etbController.getAllEtablissements)



export = router