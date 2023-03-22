const {Booking} = require('../models/booking');


const addBooking = async (req, res) => {

    try{const newBooking = await Booking.create({
        userId: req.body.userId,
        etbId: req.body.etbId,
        ownerId: req.body.ownerId,
        state: "En attente",
        people: req.body.people,
        date: req.body.date,
        time: req.body.time
    });

    await newBooking.save();
    res.status(200).json(newBooking);
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

const getBookings = async(req,res) => {

    try{
        const bookings = await Booking.find({ownerId: req.query.id})
        res.status(200).json(bookings);
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

const confirmBooking = async(req, res) => {

    try{
        await Booking.findOneAndUpdate({_id: req.body.id},{
            state: "Confirmé"
        })
        res.status(200).send("Réservation confirmé");
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

const declineBooking = async(req, res) => {

    try{
        await Booking.findOneAndUpdate({_id: req.body.id},{
            state: "Refusé"
        })
        res.status(200).send("Réservation refusé");
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

const getConfirmedBookings = async(req, res) => {
    try{
        const bookings = await Booking.find({ownerId: req.query.id, state: "Confirmé"});
        res.status(200).json(bookings)
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

export = {
    addBooking,
    getBookings,
    confirmBooking,
    declineBooking,
    getConfirmedBookings
}