import express from 'express'
import cookieParser from 'cookie-parser'
import cors from 'cors'
import bodyParser from 'body-parser'
import router from './routes/owner.routes'
import routerEtb from './routes/etb.routes'
import routerClient from './routes/customer.routes'
import {checkClient, checkProprio, checkUser} from './middleware/authMiddleware'
require("dotenv").config({path: "./config/.env"})
const db = require ("./config/db")
const app:express.Application = express()
const {Proprio} = require('./models/proprio')
const {Customer} = require('./models/customer')



// configuration des routes
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use(cors())
app.use(cookieParser())

app.use("/proprioId",checkProprio)
app.use("/clientId",checkClient)

app.get("/", checkUser, async(req:any,res ) => {
    try{
        let user = await Proprio.findById(req.user);  
        if(user == null) {
            user = await Customer.findById(req.user);  
        }
        res.json({...user._doc, token:req.token})
    }catch(error:any){
        res.status(400).json({msg: error.message})
    }
})


app.use("/api",router)
app.use("/apiEtb", routerEtb)
app.use("/apiClient", routerClient)


db.connect()
app.get(("/"), (req:express.Request, res:express.Response) => {
    res.status(200).send("Running")
})

app.listen(process.env.PORT, () => {
    console.log("Listening on port "+ process.env.PORT);
})