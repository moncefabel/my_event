import express from "express"
const routerEtb:express.Router = express.Router();
const etbController = require('../controllers/etbController')


//Ajouter une annonce
routerEtb.post("/add",etbController.addEtb)

//Recuperer tous les etablissemets
routerEtb.get("/allEtbs", etbController.getAllEtbs)

export = routerEtb