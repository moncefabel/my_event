import express from 'express'
import {checkUser } from '../middleware/authMiddleware'
const router:express.Router = express.Router()
const etbController = require('../controllers/etbController')


/**
 * @openapi
 * /apiEtb/allEtb:
 *  get:
 *   tags:
 *   - Etablissements
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
 *   summary: Get all the establishments of the owner from his id
 *   responses:
 *     200:
 *       description: Tous les établissements du propriétaire
 *     400: 
 *       description: Bad request
 */
router.get("/allEtb", checkUser,etbController.getAllEtablissements)

/**
 * @openapi
 * /apiEtb/etb:
 *  get:
 *   tags:
 *   - Etablissements
 *   parameters:
 *   - name: idOwner
 *     in: header
 *     description: the id of the etb requested for booking
 *     required: true
 *     type: string
 *   summary: get the etb which is requested for booking
 *   responses:
 *     200:
 *       description: L'établissement pour la réservation
 *     400: 
 *       description: Bad request
 */
router.get("/etb",etbController.getEtbById)


/**
 * @openapi
 * /apiEtb/add:
 *  post:
 *   tags:
 *   - Etablissements
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   requestBody:
 *     required: true
 *     content:
 *       application/json:
 *          schema:
 *             $ref: '#/components/schemas/EtbSchema'
 *   summary: Permet d'ajouter un établissement pour un propriétaire
 *   responses:
 *     200:
 *       description: Renvoie l'établissement ajouté en JSON
 *     400: 
 *       description: Bad request
 */
router.post("/add", checkUser,etbController.addEtb)

/**
 * @openapi
 * /apiEtb/add:
 *  put:
 *   tags:
 *   - Etablissements
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   requestBody:
 *     required: true
 *     content:
 *       application/json:
 *          schema:
 *             $ref: '#/components/schemas/EtbSchema'
 *   summary: Permet de modifier les informations d'un établissement
 *   responses:
 *     200:
 *       description: Renvoie d'un message de confirmation de modification
 *     400: 
 *       description: Bad request
 */
router.put("/update", checkUser,etbController.updateEtb)

/**
 * @openapi
 * /apiEtb/delete:
 *  post:
 *   tags:
 *   - Etablissements
 *   parameters:
 *   - name: token
 *     in: header
 *     description: an authorization token
 *     required: true
 *     type: string
 *   requestBody:
 *     required: true
 *     content:
 *       application/json:
 *          schema:
 *             $ref: '#/components/schemas/EtbSchema'

 *   summary: Permet de supprimer un établissement
 *   responses:
 *     200:
 *       description: Renvoie un message de confirmation de suppression
 *     400: 
 *       description: Bad request
 */
router.post("/delete",checkUser, etbController.deleteEtb)

/**
 * @openapi
 * /apiEtb/etbs:
 *  post:
 *   tags:
 *   - Etablissements
 *   parameters:
 *   - name: type
 *     in: query
 *     description: type d'établissement que l'utilisateur veut visualiser
 *     required: true
 *     type: string
 *   summary: Permet de filtrer les établissements selon le type
 *   responses:
 *     200:
 *       description: Renvoie les établissements démandés
 *     400: 
 *       description: Bad request
 */
router.get("/etbs", etbController.getEtbByPlace)



export = router