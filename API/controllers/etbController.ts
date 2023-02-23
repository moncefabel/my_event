const mongoose = require('mongoose')
const model = require('../models/etb')
const ObjectId = require('mongoose').Types.ObjectId

const getAllEtablissements =  async (req,res) => {

    try{
        const user = await model.Proprio.findById(req.params.id)
        res.status(200).send(user.etablissement)
        
    }catch(error:any){
        res.status(400).send(error.message)
    }   
}

const addEtb = async(req, res) => {

    checkingValidId(req,res)
    try{

        const newEtb = await model.Etb.create({
            nomEtablissement: req.body.nomEtablissement,
            prix: req.body.prix,
            lieu: req.body.lieu,
            horaires: req.body.horaires,
            type: req.body.type,
            userId: req.params.id
        })
        
        
        res.status(200).send("Etablissement ajouté avec succées")

    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const deleteEtb = async(req, res) => {

    
    try{ 
        const user = await model.Proprio.findById(req.params.idUser)
        const newUser = await user.get('etablissement')
        console.log(newUser);
        
        res.status(200).send("Etablissement supprimé")
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

function checkingValidId(req, res){
    if(!ObjectId.isValid(req.params.id))
        res.status(400).send("ID unknown")
}

export = {
    getAllEtablissements,
    addEtb,
    deleteEtb
}