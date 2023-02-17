import { signInWithEmailAndPassword, signOut } from "firebase/auth";

const {auth} = require("../config/db")

const signIn = async(req, res) => {

    try{
        const user = await signInWithEmailAndPassword(auth, req.body.email, req.body.password)
        res.status(200).send(user);
    }catch(error:any){
        res.status(400).send(error.message);
        
    }
}

const logOut = async (req, res) => {
    try{
        await signOut(auth)
        res.status(200).send(auth.currentUser);
        
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

export = {
    signIn,
    logOut
}