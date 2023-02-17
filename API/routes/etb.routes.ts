import express from "express"
const routerEtb:express.Router = express.Router();
const etbController = require('../controllers/etbController')


//Ajouter une annonce
routerEtb.post("/add",etbController.addEtb)

//Recuperer tous les etablissemets
routerEtb.get("/allEtbs", etbController.getAllEtbs)

//Modifier une annonce
routerEtb.put("/update/:id",etbController.updateEtb)

export = routerEtb