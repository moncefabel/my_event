const mongoose = require('mongoose')


const proprioSchema = new mongoose.Schema({

    lastName: {type:String, required:true },
    firstName: {type:String, required:true},
    phoneNumber: {type:String, required:true},
    email: {type:String, required:true},
    password: {type: String, required:true}
})

const proprioModel = mongoose.model("proprios",proprioSchema)
export = {Proprio: proprioModel}