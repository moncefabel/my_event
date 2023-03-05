module.exports.signUpErrors = (err) => {
    let errors = {email : '' , password: '' , nom: '', prenom: '', Num_tel:''};


    if(err.message.includes('email'))
        errors.email= "Email incorrect";


    if(err.message.includes('password'))
        errors.password= "Mot de passe court, veuillez entrer au moins 6 caractères";


    if(err.message.includes('nom'))
        errors.nom= "Nom court, veuillez entrer au moins 2 caractères"


    if(err.message.includes('prenom'))
        errors.prenom= "Prénom court, veuillez entrer au moins 2 caractères"

    if(err.message.includes('Num_tel'))
        errors.Num_tel="Le numéro doit contenir 10 chiffres"

    if(err.code === 11000 && Object.keys(err.keyValue)[0].includes("email"))
        errors.email= "Email déjà enregistré";

    return errors;
}