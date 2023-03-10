const mongoose = require('mongoose')
const {Etb} = require('../models/etb')
const ObjectId = require('mongoose').Types.ObjectId

const getAllEtablissements =  async (req,res) => {
    try{
        const etbs = await Etb.find({userId: req.headers.id})

        res.status(200).json(etbs)
        
    }catch(error:any){
        res.status(400).send(error.message)
    }   
}

const addEtb = async(req, res) => {

    
    try{
        console.log(req.body);
        
        const newEtb = await Etb.create({
            nomEtablissement: req.body.nameEtb,
            prix: req.body.prix,
            lieu: req.body.lieu,
            heureOuverture: req.body.heureOuverture,
            heureFermeture: req.body.heureFermeture,
            type: req.body.type,
            userId: req.body.userId,
            images: req.body.images,
            capaciteMax: req.body.capaciteMax,
            capaciteMin: req.body.capaciteMin
        })
        
        await newEtb.save()
        res.json(newEtb)

    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const updateEtb = async(req, res) => {

    try{

        const etb = await Etb.findById(req.params.id)
        
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
        
        await Etb.findByIdAndDelete(req.body.id)
        res.status(200).send("Etablissement supprimé")
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const getEtbByPlace = async(req,res) => {

    console.log(req.query.lieu);
    
    try{
        const etbs = await Etb.find({lieu: req.query.lieu})
        res.json(etbs)
    }catch(error:any){
        res.status(500).json({error: error.message})
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
    deleteEtb,
    getEtbByPlace
}