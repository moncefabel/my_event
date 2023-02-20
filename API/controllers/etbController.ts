const mongoose = require('mongoose')
const model = require('../models/proprio')
const ObjectID = require('mongoose').Types.ObjectID

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
export = {getAllEtablissements}