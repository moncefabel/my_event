// fonction permettant de se connecter à la base de donnée mongoose

const mongoose=require('mongoose')
const uri = "mongodb+srv://"+process.env.DB_USERPASS+"@cluster0.cxstilf.mongodb.net/?retryWrites=true&w=majority"

mongoose.set('strictQuery', false);
async function connect(){
    try{
        await mongoose.connect(uri)
        console.log("Connected");
    }catch(error:any){
        console.error(error);
    }
}

export = {connect}

