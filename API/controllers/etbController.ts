import axios from "axios";
import { log } from "console";

const mongoose = require("mongoose");
const { Etb } = require("../models/etb");

const getAllEtablissements = async (req, res) => {
  try {
    const etbs = await Etb.find({ userId: req.headers.id });

    res.status(200).json(etbs);
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const getEtbById = async (req, res) => {
  try {
    const etb = await Etb.find({ _id: req.headers.id });
    res.status(200).json(etb);
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const addEtb = async (req, res) => {
  try {
    console.log(req.body)
    if (!hoursValid(req.body.heureOuverture, req.body.heureFermeture)) {
      res.status(409).send("Horaires non valide");
    } else if (!nbPeopleValid(req.body.capaciteMax, req.body.capaciteMin)) {
      res.status(408).send("Capacité non valide");
    } else {
      let response = await axios.get(
        "https://maps.googleapis.com/maps/api/geocode/json",
        {
          params: {
            address: req.body.lieu,
            key: "AIzaSyAcIHoIJDQJ3TEZe3v13783jsDTxLpD6Gs",
          },
        }
      );
      let lat = response.data.results[0].geometry.location.lat;
      let long = response.data.results[0].geometry.location.lng;
      const heureO = new Date(`2023-01-01T${req.body.heureOuverture}`)
      const heureF = new Date(`2023-01-01T${req.body.heureFermeture}`)


      const newEtb = await Etb.create({
        nomEtablissement: req.body.nameEtb,
        prix: req.body.prix,
        lieu: req.body.lieu,
        heureOuverture: heureO,
        heureFermeture: heureF,
        type: req.body.type,
        userId: req.body.userId,
        images: req.body.images,
        capaciteMax: req.body.capaciteMax,
        capaciteMin: req.body.capaciteMin,
        location: {
          type: "Point",
          coordinates: [long, lat],
        },
        description: req.body.description,
      });
      res.json(newEtb);
    }
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};
function hoursValid(heureOuverture: Date, heureFermeture: Date) {
  const heureO = new Date(heureOuverture);
  const heureF = new Date(heureFermeture);

  // Vérification de la validité des heures
  if (
    heureO.getHours() < 0 ||
    heureF.getHours() > 23 ||
    heureF.getHours() < 0 ||
    heureF.getHours() > 23
  ) {
    return false;
  }

  // Vérification que l'heure de fermeture est après l'heure d'ouverture
  if (heureOuverture >= heureFermeture) {
    return false;
  }
  return true;
}
function nbPeopleValid(maxCap, minCap) {
  if (maxCap < 0 || minCap < 0) {
    return false;
  }

  if (minCap >= maxCap) {
    return false;
  }
  return true;
}
const updateEtb = async (req, res) => {
  try {
    console.log(req.body);

    await Etb.findOneAndUpdate(
      { _id: req.body._id },
      {
        nomEtablissement: req.body.nameEtb,
        prix: req.body.prix,
        lieu: req.body.lieu,
        heureOuverture: req.body.heureOuverture,
        heureFermeture: req.body.heureFermeture,
        type: req.body.type,
        capaciteMax: req.body.capaciteMax,
        capciteMin: req.body.capaciteMin,
        userId: req.body.userId,
        images: req.body.images,
        description: req.body.description,
      }
    );

    res.status(200).send("Etablissement modifié");
  } catch (error: any) {
    console.log(error.message);

    res.status(400).send(error.message);
  }
};

const deleteEtb = async (req, res) => {
  try {
    await Etb.findByIdAndDelete(req.body.id);
    res.status(200).send("Etablissement supprimé");
  } catch (error: any) {
    res.status(400).send(error.message);
  }
};

const getEtbByPlace = async (req, res) => {
  try {
    if (req.query.category == "All") {
      const etbs = await Etb.find({
        location: {
          $near: {
            $geometry: {
              type: "Point",
              coordinates: [req.query.lng, req.query.lat],
            },
            $maxDistance: 5000,
          },
        },
      });
      console.log(etbs);

      res.json(etbs);
    } else {
      const etbs = await Etb.find({
        location: {
          $near: {
            $geometry: {
              type: "Point",
              coordinates: [req.query.lng, req.query.lat],
            },
            $maxDistance: 5000,
          },
        },
        type: req.query.category,
      });
      res.json(etbs);
    }
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
};

export = {
  getAllEtablissements,
  addEtb,
  updateEtb,
  deleteEtb,
  getEtbByPlace,
  getEtbById,
};
