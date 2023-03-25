const mongooseBook = require('mongoose')


const bookingSchema = new mongooseBook.Schema({
    userId: {type:mongooseBook.ObjectId, required:true },
    etbId: {type: mongooseBook.ObjectId, required:true},
    ownerId: {type: mongooseBook.ObjectId, required:true},
    state: {type:String, required:true},
    people: {type:Number, },
    time: {type: String, },
    date: {type: String, }
})

const bookingModel = mongooseBook.model("demandes",bookingSchema)
export = {Booking: bookingModel}