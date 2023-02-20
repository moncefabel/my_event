const mongoose = require('mongoose')
const model = require('../models/proprio')
const ObjectId = require('mongoose').Types.ObjectId
const bcrypt = require('bcrypt')

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
    
    checkingValidId(req,res)
    try{
        const user = await model.Proprio.findById(req.params.id)
        
        user.lastName= req.body.lastName || user.lastName
        user.firstName= req.body.firstName || user.firstName
        user.phoneNumber= req.body.phoneNumber || user.phoneNumber
        user.email= req.body.email || user.email
        
        await user.save()
        res.status(200).send("Informations modifiées")
        
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const changePassword = async (req, res) => {
    checkingValidId(req, res)

    try{
        const user = await model.Proprio.findById(req.params.id)
        const salt = await bcrypt.genSalt()
        user.password =  await bcrypt.hash(req.body.password, salt)
        await user.save()
        res.status(200).send("Mot de passe modifié")
    }catch(error:any){
        res.status(400).send(error.message)
    }
}


function checkingValidId(req, res){
    if(!ObjectId.isValid(req.params.id))
        res.status(400).send("ID unknown")
}

export = {
    getAllOwners,
    getOwnerById,
    updateOwner,
    changePassword
}