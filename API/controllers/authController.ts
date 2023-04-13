
const mongoose = require('mongoose')
const {Proprio} = require('../models/proprio')
const {Customer} = require('../models/customer')
const bcrypt = require('bcrypt')
const jwt = require("jsonwebtoken");
const {signUpErrors} = require('../utils/errors')
const maxAge = 3 * 24 * 60 * 60 * 1000;


const addProprio =  async (req,res) => {

    try{
    
        const newUser = await Proprio.create({
            lastName: req.body.lastName,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber,
            email: req.body.email,
            password: req.body.password,
        })
        
        res.status(200).json(newUser.id)
    }catch(error:any){
        // const errors = signUpErrors(error)
        res.status(400).send(error)
    }
}
const addCustomer =  async (req,res) => {

    try{
        
        
        const newUser = await Customer.create({
            lastName: req.body.lastName,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber,
            email: req.body.email,
            password: req.body.password,
        })
        
        res.status(200).json(newUser.id)
    }catch(error:any){
        // const errors = signUpErrors(error)
        res.status(400).send(error.message)
    }
}

const signInProprio = async(req, res) => {
    try{
        
        const user = await Proprio.findOne({email: req.body.email})
        if(isExists(user)){
            if(req.body.password == user.password){                
                const token = createToken(user._id)
                res.status(200).json({token, ...user._doc})
            }else{
                res.status(401).send("Password incorrect")
            }
        }else{
            res.status(402).send("Email introuvable")
        }
    }catch(error:any){
        res.status(400).send(error.message)
    }
}
const signInCustomer = async(req, res) => {
    try{
        
        const user = await Customer.findOne({email: req.body.email})
        if(isExists(user)){
                    
            if(req.body.password == user.password){
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
    addProprio,
    addCustomer,
    signInProprio,
    logOut,
    signInCustomer
}