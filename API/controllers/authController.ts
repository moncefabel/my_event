const mongoose = require('mongoose')
const model = require('../models/proprio')
const bcrypt = require('bcrypt')
const jwt = require("jsonwebtoken");
const {signUpErrors} = require('../utils/errors')
const maxAge = 3 * 24 * 60 * 60 * 1000;


const addUser =  async (req,res) => {

    try{
        const salt = await bcrypt.genSalt()
        const hashPassword =  await bcrypt.hash(req.body.password, salt)
        
        const newUser = await model.Proprio.create({
            lastName: req.body.lastName,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber,
            email: req.body.email,
            password: hashPassword,
        })
        
        res.status(200).json(newUser.id)
    }catch(error:any){
        // const errors = signUpErrors(error)
        res.status(400).send(error.message)
    }
}

const signIn = async(req, res) => {
    try{
        
        const user = await model.Proprio.findOne({email: req.body.email})
        if(isExists(user)){
            const auth = await bcrypt.compare(req.body.password, user.password)    
                    
            if(auth){
                const token = createToken(user._id)
                res.status(200).json({token, ...user._doc})
            }else{
                throw Error("Password incorrect")
            }
        }else{
            throw Error("Email introuvable")
        }
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const logOut = async(req, res) => {
    res.cookie("jwt","", {maxAge:1})
    res.redirect("/")
}

function isExists(user){
    return user
}

function createToken(id){
    return jwt.sign({ id }, process.env.TOKEN_SECRET, {
      expiresIn: maxAge,
    });
};

export = {
    addUser,
    signIn,
    logOut
}