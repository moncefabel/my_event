const mongoose = require('mongoose')


const proprioSchema = new mongoose.Schema({
    lastName: {type:String, required:true },
    firstName: {type:String, required:true},
<<<<<<< HEAD
    phoneNumber: {type:String, required:true, unique:true},
    email: {type:String, required:true, unique:true},
    password: {type: String, required:true}
=======
    phoneNumber: {type:String, required:true},
    email: {type:String, required:true},
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

>>>>>>> 6764e12fe999057bfedaf48d28e173673b22cecf
})

const proprioModel = mongoose.model("proprios",proprioSchema)
module.exports = {Proprio: proprioModel}