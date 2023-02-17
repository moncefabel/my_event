import { createUserWithEmailAndPassword, deleteUser, updateEmail, updatePassword } from "@firebase/auth"
import { collection, deleteDoc, doc, getDoc, getDocs, setDoc, updateDoc } from "@firebase/firestore"
import { getDownloadURL, ref } from "@firebase/storage"
import express from 'express'
const {db,auth,storage} = require("../config/db")
const etbController = require("../controllers/etbController")

const createAccountOwner = async (req:express.Request, res:express.Response) => {
 
    let owner;
    try{
        owner = await createUserWithEmailAndPassword(auth, req.body.email, req.body.password)
        
        const userCollectionRef = collection(db,"proprio")
        const etbCollectionRef = collection(db, "proprio/"+owner.user.uid+"/etablissements")
        const imageEtbUrl = await getDownloadURL(ref(storage,'bergo(61).png'))
        
        const ownerInofrmations = {
            name: req.body.name,
            firstName: req.body.firstName,
            // phoneNumber: req.body.phoneNumber,
        }

        const etbInformations = {
            name: req.body.nameEtb,
            // place: req.body.place,
            // activity: req.body.activity,
            // minCapacity: req.body.minCapacity,
            // maxCapacity: req.body.maxCapacity,
            // opening: req.body.opening,
            // closing: req.body.closing,
            pictures: imageEtbUrl
        }

        await setDoc(doc(userCollectionRef,owner.user.uid),ownerInofrmations)
        await setDoc(doc(etbCollectionRef),etbInformations)
        res.status(200).send("Proprio ajouté avec succés")
    }catch(error:any){
        if(owner){
            owner = auth.currentUser
            try{
                await deleteUser(owner)
            }catch(err:any){
                console.log(err.message);
            }
        }
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

const updateDataOwner = async (req, res) => {
    try{
        const user = auth.currentUser
        const userDocRef = doc(db, "proprio", user.uid)
        const ownerInofrmations = {
            name: req.body.name,
            firstName: req.body.firstName,
            phoneNumber: req.body.phoneNumber
        }
        await updateEmail(user, req.body.email)
        await updatePassword(user, req.body.password)
        await updateDoc(userDocRef, ownerInofrmations)
        res.status(200).send("User updated succesfully")
    }catch(error:any){
        res.send(error.message);
        
    }
}

const deleteOwner = async(req, res) => {

    try{
        etbController.deleteAllEtb(req,res)
        const user = auth.currentUser
        const ownerCollectionRef = doc(db, "proprio",user.uid)
        await deleteDoc(ownerCollectionRef)
        await deleteUser(user)
        res.status(200).send("User deleted succcesfully")
    }catch(error:any){
        res.status(400).send(error.message);
        
    }
}

export = {
    createAccountOwner,
    getAllOwners,
    getOwnerById,
    updateDataOwner,
    deleteOwner
}


