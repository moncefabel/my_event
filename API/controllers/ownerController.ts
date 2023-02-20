const mongoose = require('mongoose')
const model = require('../models/proprio')

const getAllOwners =  async (req,res) => {

    try{
        const users = await model.Proprio.find()
        res.status(200).json(users)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}



const getOwnerById =async (req, res) => {
    
    try{
        const user = await model.Proprio.findById(req.params.id)
        res.status(200).json(user)
    }catch(error:any){
        res.status(400).send(error.message)
    }
    
}


export = {getAllOwners,getOwnerById}