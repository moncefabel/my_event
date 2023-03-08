const mongooseEtb = require('mongoose')
const etbSchema = new mongooseEtb.Schema({
    nomEtablissement: {type:String, required:true },
    prix: {type:String, required:true},
    lieu: {type:String, required:true},
    heureOuverture: {type:String, required:true},
    heureFermeture: {type:String, required:true},
    type: {type: String, required:true},
    userId: {type: mongooseEtb.ObjectId, required:true},
    images: [{type: String}],
    capaciteMax: {type:String},
    capaciteMin: {type:String},

})


const etbModel = mongooseEtb.model("etablissements",etbSchema)
module.exports = {Etb: etbModel}