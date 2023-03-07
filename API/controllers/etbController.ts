const mongoose = require('mongoose')
const model = require('../models/etb')
const ObjectId = require('mongoose').Types.ObjectId

const getAllEtablissements =  async (req,res) => {
    try{
        const etbs = await model.Etb.find({userId: req.headers.id})

        res.status(200).json(etbs)
        
    }catch(error:any){
        res.status(400).send(error.message)
    }   
}

const addEtb = async(req, res) => {

    
    try{
        
        const newEtb = await model.Etb.create({
            nomEtablissement: req.body.nameEtb,
            // prix: req.body.prix,
            // lieu: req.body.lieu,
            // horaires: req.body.horaires,
            // type: req.body.type,
            userId: req.body.userId,
            images: req.body.images
        })
        
        await newEtb.save()
        res.json(newEtb)

    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const updateEtb = async(req, res) => {

    try{

        const etb = await model.Etb.findById(req.params.id)
        
        etb.nomEtablissement = req.body.nomEtablissement || etb.nomEtablissement
        etb.prix = req.body.prix || etb.prix
        etb.lieu = req.body.lieu || etb.lieu
        etb.horaires = req.body.horaires || etb.horaires
        etb.type = req.body.type || etb.type
        
        await etb.save()
        res.status(200).send("Etablissement modifié")

    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const deleteEtb = async(req, res) => {

    try{ 
        await model.Etb.deleteOne(req.params.id)
        res.status(200).send("Etablissement supprimé")
    }catch(error:any){
        res.status(400).send(error.message)
    }
}


// function checkingValidId(req, res){
//     if(!ObjectId.isValid(req.params.id))
//         res.status(400).send("ID unknown")
// }

export = {
    getAllEtablissements,
    addEtb,
    updateEtb,
    deleteEtb
}