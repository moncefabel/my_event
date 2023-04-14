const mongooseEtb = require('mongoose')
const etbSchema = new mongooseEtb.Schema({
    nomEtablissement: {type:String, required:true, unique:true },
    prix: {type:String, required:true},
    lieu: {type:String, required:true},
    heureOuverture: {type:Date, required:true},
    heureFermeture: {type:Date, required:true},
    type: {type: String, required:true},
    userId: {type: mongooseEtb.ObjectId, required:true},
    images: [{type: String}],
    capaciteMax: {type:Number},
    capaciteMin: {type:Number},
    location: {
        type: {type: String},
        coordinates: []
    },
    description: {type: String}

})


etbSchema.index({location:"2dsphere"})
const etbModel = mongooseEtb.model("etablissements",etbSchema)
module.exports = {Etb: etbModel}