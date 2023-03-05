const jwt = require("jsonwebtoken");
const model = require("../models/proprio");

export const checkAuth = async (req, res, next) => {

    const token = req.header('jwt')
    if (!token) {
        return res.status(401).json({msg: "No token"});
    }

    jwt.verify(token , process.env.TOKEN_SECRET, async (err, decodedToken) => {
        if(err)
            return res.status(403).json("Invalid token")
        let user = await model.Proprio.findById(decodedToken.id);
        if(!user){
            return res.json(false)
        }
        res.json(true)
    })
};

export const checkUser = async (req, res, next) => {

    try{
        const token = req.header('jwt')
        
        if(!token){
            return res.status(401).json({msg: "No auth token"})
        }

        const verified = jwt.verify(token, process.env.TOKEN_SECRET)
        if(!verified){
            return res.status(401).json({msg: "Token failed, authorization failed"})
        }

        req.user = verified.id;
        req.token = token;
        next();
    }catch(error:any){
        res.status(400).json({error: error.message})
    }
    
}

