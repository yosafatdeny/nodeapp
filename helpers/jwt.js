const jwt = require ('jsonwebtoken');

module.exports = {
    createJWTToken(payload){
        return jwt.sign(payload, "kucingKoneng", { expiresIn : '12h' })
    }
}