const jwt = require("jsonwebtoken");
const model = require("../models/proprio");

export const checkAuth = async (req, res, next) => {

    const token = req.cookies.jwt;
    if (!token) {
        return res.status(401).send("No token");
    }

    jwt.verify(token , process.env.TOKEN_SECRET, async (err, decodedToken) => {
        if(err)
            return res.status(403).send("Invalid token")
        let user = await model.Proprio.findById(decodedToken.id);
        if(user){
            res.locals.user = user;
        }
        next()
    })
};

export const checkUser = async (req, res, next) => {

    const token = req.cookies.jwt;
    
    if (token) {
        jwt.verify(token, process.env.TOKEN_SECRET, async (err, decodedToken) => {
            if (err) {
                res.locals.user = null;
                res.cookie("jwt", "", { maxAge: 1 });
                next();
            }
            else{
                let user = await model.Proprio.findById(decodedToken.id);
                if(user){
                    res.locals.user = user;
                    next();
                }
            }
        });
    } 
    else {
        res.locals.user = null;
        next();
    }
}

