import express from "express"
const routerEtb:express.Router = express.Router();
const etbController = require('../controllers/etbController')


//Ajouter une annonce
routerEtb.post("/etb/add",etbController.addEtb)

export = routerEtb