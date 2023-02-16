import express from 'express'
const port = 5000

const app:express.Application = express()


app.get(("/"), (req:express.Request, res:express.Response) => {
    res.status(200).send("Running")
})

app.listen(port, () => {
    console.log("Listening on port "+ port);
})