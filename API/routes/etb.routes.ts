import express from 'express'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')

router.get("/proprios/etablissements/:id", etbController.getAllEtablissements)



export = router