import express from "express";
import { checkUser } from "../middleware/authMiddleware";
const router: express.Router = express.Router();
const ownerController = require("../controllers/ownerController");
const authController = require("../controllers/authController");

/**
 * @openapi
 * /api/proprios:
 *  get:
 *   tags:
 *   - Proprios
 *   summary: Get all the owners from the DB
 *   responses:
 *     200:
 *       description: Infos de tous les proprios en JSON
 */
router.get("/proprios", ownerController.getAllOwners);

/**
 * @openapi
 * /api/register:
 *  post:
 *   tags:
 *   - Proprios
 *   summary: Register an owner of establishment
 *   requestBody:
 *     required: true
 *     content:
 *       application/json:
 *          schema:
 *             $ref: '#/components/schemas/ProprioSchema'  
 *   responses:
 *     200:
 *       description: Success
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ProprioSchemaResponse'
 *     400:
 *       description: Bad request
 *      
 */
router.post("/register", authController.addProprio);

/**
 * @openapi
 * /api/signIn:
 *  post:
 *   tags:
 *   - Proprios
 *   summary: Login an owner of establishment
 *   requestBody:
 *     required: true
 *     content:
 *       application/json:
 *          schema:
 *             type: object
 *             properties:
 *               email:
 *                 type: string
 *                 default: jane.doe@example.com
 *               password:
 *                 type: string
 *                 default: test12
 *   responses:
 *     200:
 *       description: Success
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ProprioSchemaResponse'
 *     400:
 *       description: Bad request
 *      
 */
router.post("/signIn", authController.signInProprio);

//Déconnexion d'un utilisateur
router.post("/logOut", checkUser, authController.logOut);

//Modifier les informations d'un utilisateur
router.put("/update", checkUser, ownerController.updateOwner);

//Modification du mot de passe
router.put("/updatePassword/:id", checkUser, ownerController.changePassword);

//Supprimer un propriétaire
router.delete("/delete/:id", checkUser, ownerController.deleteOwner);

export = router;
