const {db,auth,storage} = require("../config/db")
import { getDownloadURL, ref } from "firebase/storage"
import { collection, setDoc, doc, getDocs, deleteDoc } from "firebase/firestore"



const addEtb = async(req,res) => {
    
    try{
        const owner = auth.currentUser
        const etbCollectionRef = collection(db, "proprio/"+owner.uid+"/etablissements")
        const imageEtbUrl = await getDownloadURL(ref(storage,'bergo(61).png'))

        const etbInformations = {
            name: req.body.nameEtb,
            place: req.body.place,
            activity: req.body.activity,
            minCapacity: req.body.minCapacity,
            maxCapacity: req.body.maxCapacity,
            opening: req.body.opening,
            closing: req.body.closing,
            pictures: imageEtbUrl
        }

        await setDoc(doc(etbCollectionRef),etbInformations)
        res.status(200).send("Etablissement ajouté avec succés")
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

const getAllEtbs = async (req, res) => {

    try{    
        const owner = auth.currentUser
        const etbCollectionRef = collection(db,"proprio/"+owner.uid+"/etablissements")
        const etbs = await getDocs(etbCollectionRef)
        const dataEtbs = getData(etbs)
        res.status(200).send(dataEtbs)
    }catch(error:any){
        res.status(400).send(error.message)
    }
}

const deleteAllEtb = async(req, res) => {

    try{
        const user = auth.currentUser
        const etbCollectionRef = collection(db, "proprio/"+user.uid+"/etablissements")        
        const idEtb = await getDocs(etbCollectionRef)
        
        idEtb.docs.map(async element => 
            await deleteDoc(element.ref)  
        )
    }catch(error:any){
        res.status(400).send(error.message);
    }
}

export = {
    addEtb,
    getAllEtbs,
    deleteAllEtb
}