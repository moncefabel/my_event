import express from 'express'
import cookieParser from 'cookie-parser'
import cors from 'cors'
import bodyParser from 'body-parser'
import router from './routes/owner.routes'
const routerEtb = require('./routes/etb.routes')
const dotenv = require("dotenv").config({path: "./config/.env"})
const db = require ("./config/db")
const port = 5000
const app:express.Application = express()


// configuration des routes
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use(cors())
app.use(cookieParser())
app.use("/api",router)
app.use("/apiEtb", routerEtb)


db.connect()
app.get(("/"), (req:express.Request, res:express.Response) => {
    res.status(200).send("Running")
})

app.listen(process.env.PORT, () => {
    console.log("Listening on port "+ process.env.PORT);
})