import { createUserWithEmailAndPassword } from "@firebase/auth"
import { collection, doc, getDoc, getDocs, setDoc } from "@firebase/firestore"
import { getDownloadURL, ref } from "@firebase/storage"
import express from 'express'
const {db,auth,storage} = require("../config/db")

const createAccountOwner = async (req:express.Request, res:express.Response) => {
 
    try{
        const owner = await createUserWithEmailAndPassword(auth, req.body.email, req.body.password)
        
        const userCollectionRef = collection(db,"proprio")
        const etbCollectionRef = collection(db, "proprio/"+owner.user.uid+"/etablissements")
        const imageEtbUrl = await getDownloadURL(ref(storage,'bergo(61).png'))
        
        const ownerInofrmations = {
            name: req.body.name,
            firstName: req.body.firstName,
        }

        const etbInformations = {
            name: req.body.nameEtb,
            place: req.body.place,
            activity: req.body.activity,
            minCapacity: req.body.minCapacity,
            maxCapacity: req.body.maxCapacity,
            opening: req.body.opening,
            closing: req.body.closing,
            phoneNumber: req.body.phoneNumber,
            pictures: imageEtbUrl
        }

        await setDoc(doc(userCollectionRef,owner.user.uid),ownerInofrmations)
        await setDoc(doc(etbCollectionRef),etbInformations)
        res.status(200).send("Proprio ajouté avec succés")
    }catch(error:any){
        res.status(400).send(error.message)
    }
    
}

function getData(data){
    let dataOwners:any[] = []
    dataOwners = data.docs.map(element => 
        element.data()
    );
    return dataOwners
}

const getAllOwners = async(req:express.Request, res:express.Response) => {
    try{
        const userCollectionRef = collection(db,"proprio")
        const data = await getDocs(userCollectionRef)
        const dataOwners = getData(data)
        res.status(200).send(dataOwners)
    }catch(error){
        res.send(error)
    }
}

const getOwnerById = async(req,res) => {

    try{
        const dataOwnersRef = doc(db,"proprio",req.params.id)
        const docSnap = await getDoc(dataOwnersRef)
        if(docSnap.exists()){
            res.status(200).send(docSnap.data())
        }else{
            res.status(200).send("No data")
        }
        
    }catch(error:any){
        res.status(400).send(error.message)
    }
}



export = {
    createAccountOwner,
    getAllOwners,
    getOwnerById,
}


