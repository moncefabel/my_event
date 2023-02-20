const mongoose = require('mongoose')
const model = require('../models/proprio')
const bcrypt = require('bcrypt')

const addUser =  async (req,res) => {

    try{
        const salt = await bcrypt.genSalt()
        const hashPassword =  await bcrypt.hash(req.body.password, salt)

        const newUser = await model.Proprio.create({
            lastName: req.body.lastName,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber,
            email: req.body.email,
<<<<<<< HEAD
            password: hashPassword
=======
            password: req.body.password,
            etablissement: req.body.etablissement
>>>>>>> 6764e12fe999057bfedaf48d28e173673b22cecf
        })

        res.status(200).json(newUser.id)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}


export = {addUser}