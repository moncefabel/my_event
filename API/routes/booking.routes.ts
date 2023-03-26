import express from 'express'
const router:express.Router = express.Router()
const bookingController = require('../controllers/bookingController')


router.post('/add', bookingController.addBooking);
router.get('/bookings',  bookingController.getBookings)
router.put('/confirm', bookingController.confirmBooking)
router.delete('/decline', bookingController.declineBooking)
router.get('/confirmed', bookingController.getConfirmedBookings)


export = router