const mongoose = require('mongoose')
const model = require('../models/proprio')
const ObjectID = require('mongoose').Types.ObjectID

const getAllOwners =  async (req,res) => {

    try{
        const users = await model.Proprio.find().select("-password")
        res.status(200).json(users)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}


const getOwnerById =async (req, res) => {
    
    try{
        const user = await model.Proprio.findById(req.params.id).select("-password")
        res.status(200).json(user)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const updateOwner = async(req, res) => {
    
    // if(!ObjectID.isValid(req.params.id))
    //     res.status(400).send("ID unknown")
    try{
        const user = await model.Proprio.findById(req.params.id)
        
        user.lastName= req.body.lastName || user.lastName
        user.firstName= req.body.firstName || user.firstName
        user.phoneNumber= req.body.phoneNumber || user.phoneNumber
        user.email= req.body.email || user.email
        
        const newUser = await user.save()
        res.status(200).send(newUser)
        
    }catch(error:any){
        res.status(400).send(error.message)
    }
}


export = {
    getAllOwners,
    getOwnerById,
    updateOwner
}