import mongoose from "mongoose";

/**
 * @openapi
 * components:
 *  schemas:
 *    ProprioSchema:
 *      type: object
 *      required:
 *        - email
 *        - password
 *        - firstName
 *        - phoneNumber
 *        - lastName
 *      properties:
 *        email:
 *          type: String
 *          default: jane.doe@example.com
 *        firstName:
 *          type: String
 *          default: jane
 *        lastName:
 *          type: String
 *          default: doe
 *        password:
 *          type: String
 *          default: test12
 *        phoneNumber:
 *          type: String
 *          default: 0123456789
 *    ProprioSchemaResponse:
 *      type: object
 *      properties:
 *        email:
 *          type: String
 *        firstName:
 *          type: String
 *        lastName:
 *          type: String
 *        _id:
 *          type: String
 *        phoneNumber:
 *          type: String
 *    ProprioSchemaUpdate:
 *      type: object
 *      properties:
 *        email:
 *          type: String
 *          default: modifyEmail@example.com
 *        firstName:
 *          type: String
 *          default: test
 *        lastName:
 *          type: String
 *          default: test
 *        phoneNumber:
 *          type: String
 *          default: 0987625186
 *
 *
 */
const proprioSchema = new mongoose.Schema({
  lastName: {
    type: String,
    required: true,
  },
  firstName: {
    type: String,
    required: true,
  },
  phoneNumber: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
});

const proprioModel = mongoose.model("proprios", proprioSchema);
export = { Proprio: proprioModel };
