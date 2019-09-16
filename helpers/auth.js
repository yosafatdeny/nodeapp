const jwt = require ('jsonwebtoken');

module.exports = {
    auth : (req, res, next) => {
        // console.log('disini',JSON.parse(req.body))
        // console.log('req =====> ', req)
        // console.log('req-method ====> ', req.method)
        // console.log('req-token =====> ', req.token)
        if (req.method !== "OPTIONS") {
            // let success = true;
            console.log('req-token juga =====> ',req.token)
            jwt.verify(req.token, "kucingKoneng", (error, decoded) => {
                if (error) {
                    // success = false;
                    return res.status(401).json({ message: "User not authorized.", error: "disini - User not authorized." });
                }
                //console.log(decoded)
                req.user = decoded;
                next();
            });
        } else {
            next();
        }
    }
}


