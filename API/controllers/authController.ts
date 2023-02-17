import { signInWithEmailAndPassword } from "firebase/auth";

const {auth} = require("../config/db")

const signIn = async(req, res) => {

    try{
        const user = await signInWithEmailAndPassword(auth, req.body.email, req.body.password)
        res.status(200).send(user);
    }catch(error:any){
        res.status(400).send(error.message);
        
    }
}

export = {signIn}