module.exports = app => {
    const user = require("../controller/userController")

    // Default
    app.get("/", (req, res) => {
        res.json({ Hello: "Welcome to Pinjemin Apps." });
    });

    // Customer
    // All Customer    
    app.get("/customer", user.findAll);

    // Find One Customer
    app.get("/customer/:userId", user.findOne);

    //Offer

    //Request

    //Log Request

    //Log Offer

    //Type
}