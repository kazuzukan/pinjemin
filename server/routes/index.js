module.exports = app => {
    const user = require("../controller/userController")

    // Default
    app.get("/", (req, res) => {
        res.json({ Hello: "Welcome to Pinjemin Apps." });
    });

    // Customer
    // All User   
    app.get("/users", user.findAllUser);

    // Find One User
    app.get("/user/:id", user.findOne);

    //Create User
    app.post("/user", user.createUser);

    //Update User
    app.put("/user/:id", user.updateUser);

    //Delete User
    app.delete("/user/:id", user.deleteUser);
    //Offer

    //Request

    //Log Request

    //Log Offer

    //Type
}