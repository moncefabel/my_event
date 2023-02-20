const mongoose = require('mongoose')


const proprioSchema = new mongoose.Schema({
    lastName: {type:String, required:true },
    firstName: {type:String, required:true},
    phoneNumber: {type:String, required:true, unique:true},
    email: {type:String, required:true, unique:true},
    password: {type: String, required:true},
    etablissement:[
        {
            nomEtablissement: {type: String, required: true},
            prix: {type:String, required: true},
            lieu: {type:String, required: true},
            horaires: {type: String, required: true},
            typeEtablissement: {type: String, required: true}
        }
    ]

})

const proprioModel = mongoose.model("proprios",proprioSchema)
module.exports = {Proprio: proprioModel}