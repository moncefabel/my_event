const mongoose = require('mongoose')
const model = require('../models/proprio')
const ObjectId = require('mongoose').Types.ObjectId

const getAllEtablissements =  async (req,res) => {

    try{
        model.Proprio.findById(req.params.id, (err, foundDocument) => {
            const myFiledValue = foundDocument.etablissement
            res.status(200).send(myFiledValue)
        })
    }catch(error:any){
        res.status(400).send(error.message)
    }   
}

const addEtb = async(req, res) => {

    checkingValidId(req,res)
    try{

        const user = await model.Proprio.findById(req.params.id)
        const newEtb = {
            nomEtablissement: req.body.etablissement[0].nomEtablissement,
            prix: req.body.etablissement[0].prix,
            lieu: req.body.etablissement[0].lieu,
            horaires: req.body.etablissement[0].horaires,
            typeEtablissement: req.body.etablissement[0].typeEtablissement
        }
        
        await user.etablissement.push(newEtb)
        await user.save()
        res.status(200).send("Etablissement ajouté avec succées")

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
    addEtb
}