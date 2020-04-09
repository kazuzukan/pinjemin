module.exports = app => {
    const user = require("../controller/userController")

    // Default
    app.get("/", (req, res) => {
        res.json({ Hello: "Welcome to Pinjemin Apps." });
    });

    // Customer
    // All Customer    
    app.get("/customers", user.findAll);

    // Find One Customer
    app.get("/customer/:userId", user.findOne);

    //Create Customer
    app.post("/customer", user.createUser);
    //Offer

    //Request

    //Log Request

    //Log Offer

    //Type
}