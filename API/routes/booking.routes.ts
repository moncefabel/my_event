import express from 'express'
const router:express.Router = express.Router()
const bookingController = require('../controllers/bookingController')
import {checkUser } from '../middleware/authMiddleware'


/**
 * @openapi
 * /apiBooking/add:
 *  post:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   summary: Permet d'ajouter une demande de réservation 
 *   responses:
 *     200:
 *       description: Les informations de la demande
 *     400: 
 *       description: Bad request
 *     406: 
 *       description: Heure invalide
 *     407: 
 *       description: Nombre de perssone invalide
 */
router.post('/add',checkUser, bookingController.addBooking);

/**
 * @openapi
 * /apiBooking/bookings:
 *  get:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   - name: idOwner
 *     in: header
 *     description: the id of the owner who's connected
 *     required: true
 *     type: string
 *   summary: Permet de recuperer toutes les demandes de réseration d'un proprio
 *   responses:
 *     200:
 *       description: Les informations de la demande
 *     400: 
 *       description: Bad request
 */
router.get('/bookings', checkUser, bookingController.getBookings)


/**
 * @openapi
 * /apiBooking/confirm:
 *  put:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   summary: Permet de confirmer la demande de reservation
 *   responses:
 *     200:
 *       description: Reservation confirmée
 *     400: 
 *       description: Bad request
 */
router.put('/confirm', checkUser, bookingController.confirmBooking)

/**
 * @openapi
 * /apiBooking/confirm:
 *  put:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   summary: Permet de confirmer la demande de reservation
 *   responses:
 *     200:
 *       description: Reservation confirmée
 *     400: 
 *       description: Bad request
 */
router.delete('/decline', bookingController.declineBooking)

/**
 * @openapi
 * /apiBooking/confirmed:
 *  put:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   - name: ownerId
 *     in: header
 *     description: l'id de user qui est connecté
 *     required: true
 *     type: string
 *   summary: Permet de récuperer les demandes de réservation validées par les proprios
 *   responses:
 *     200:
 *       description: Les réservations confirmées en JSON
 *     400: 
 *       description: Bad request
 */
router.get('/confirmed', bookingController.getConfirmedBookings)

/**
 * @openapi
 * /apiBooking/confirmed:
 *  put:
 *   tags:
 *   - Bookings
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   - name: userId
 *     in: header
 *     description: l'id de user qui est connecté
 *     required: true
 *     type: string
 *   summary: Permet de récuperer les demandes de réservation d'un client
 *   responses:
 *     200:
 *       description: Reservation confirmée
 *     400: 
 *       description: Bad request
 */
router.get('/userBookings', bookingController.getBookingsOfTheUser)


export = router