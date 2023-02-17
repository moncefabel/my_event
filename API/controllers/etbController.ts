const {db,auth,storage} = require("../config/db")
import { getDownloadURL, ref } from "firebase/storage"
import { collection, setDoc, doc } from "firebase/firestore"



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
export = {addEtb}