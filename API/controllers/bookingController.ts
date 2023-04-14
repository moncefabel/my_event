import { log } from "console";

const { Etb } = require("../models/etb");
const { Booking } = require("../models/booking");

const addBooking = async (req, res) => {
  

  try {
    const etb = await getEtbRequestedById(req.body.etbId);
    if (
      !nbPeopleIsValid(req.body.people, etb[0].capaciteMin, etb[0].capaciteMax)
    ) {
      res
        .status(406)
        .send("Nombre de personnes inférieur ou supérieur au nombre possible");
    }
    else if (
      !timeIsValid(req.body.time, etb[0].heureOuverture, etb[0].heureFermeture)
    ) {
      res
        .status(407)
        .send("L'heure est invalide ou ne respecte pas les criteres");
    } else {
      const newBooking = await Booking.create({
        userId: req.body.userId,
        etbId: req.body.etbId,
        ownerId: req.body.ownerId,
        state: "En attente",
        people: req.body.people,
        date: req.body.date,
        time: req.body.time,
        tokenDevice: req.body.tokenDevice,
        nameEtb: req.body.nameEtb,
      });
      res.status(200).json(newBooking);
    }
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const getBookings = async (req, res) => {
  try {
    const bookings = await Booking.find({ ownerId: req.headers.id });

    res.status(200).json(bookings);
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const confirmBooking = async (req, res) => {
  try {
    await Booking.findOneAndUpdate(
      { _id: req.body.id },
      {
        state: "Confirmé",
      }
    );
    res.status(200).send("Réservation confirmé");
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const declineBooking = async (req, res) => {
  try {
    await Booking.deleteOne({ _id: req.body.id });
    res.status(200).send("Réservation refusé");
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const getConfirmedBookings = async (req, res) => {
  try {
    const bookings = await Booking.find({
      ownerId: req.query.id,
      state: "Confirmé",
    });
    res.status(200).json(bookings);
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const getBookingsOfTheUser = async (req, res) => {
  try {
    const bookings = await Booking.find({ userId: req.headers.id });
    res.status(200).json(bookings);
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

function nbPeopleIsValid(nbPeople: Number, minCap: Number, maxCap: Number) {
  return nbPeople <= maxCap && nbPeople >= minCap;
}
function timeIsValid(timeRequested: Date, heureO: Date, heureF: Date) {
  const date = new Date(timeRequested);

  const heureReservee = date.getHours();
  const heureOuv = heureO.getHours();
  const heureFerm = heureF.getHours();

  return heureReservee >= heureOuv && heureReservee < heureFerm;
}
async function getEtbRequestedById(id: String) {
  try {
    const etb = await Etb.find({ _id: id });
    return etb;
  } catch (error: any) {
    console.log(error);
  }
}
export = {
  addBooking,
  getBookings,
  confirmBooking,
  declineBooking,
  getConfirmedBookings,
  getBookingsOfTheUser,
};
