const mongooseBook = require('mongoose')


const bookingSchema = new mongooseBook.Schema({
    userId: {type:mongooseBook.ObjectId, required:true },
    etbId: {type: mongooseBook.ObjectId, required:true},
    ownerId: {type: mongooseBook.ObjectId, required:true},
    state: {type:String, required:true},
    people: {type:Number, required:true},
    time: {type: Date, required:true},
    date: {type: String, required:true},
    tokenDevice: {type: String, },
    nameEtb: {type: String, }
})

const bookingModel = mongooseBook.model("demandes",bookingSchema)
export = {Booking: bookingModel}