const mongoose = require('mongoose')
const model = require('../models/proprio')

const addUser =  async (req,res) => {

    try{
        const newUser = await model.Proprio.create({
            lastName: req.body.lastName,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber,
            email: req.body.email,
            password: req.body.password
        })

        res.status(200).json(newUser)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}
export = {addUser}