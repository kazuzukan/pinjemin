module.exports = (app) => {
  const user = require("../controller/userController");
  const offer = require("../controller/offerController");
  const requests = require("../controller/requestController");

  // Default
  app.get("/", (req, res) => {
    res.json({ Hello: "Welcome to Pinjemin Apps." });
  });

  // Customer
  // All User
  app.get("/users", user.findAllUser);

  // Find One User
  app.get("/user/:id", user.findOne);

  //Find User Offer
  app.get("/useroffer/:id", user.findUserOffer);

  //Find User Request
  app.get("/userrequest/:id", user.findUserOffer);

  //Create User
  app.post("/user", user.createUser);

  //Update User
  app.put("/user/:id", user.updateUser);

  //Delete User
  app.delete("/user/:id", user.deleteUser);


  //Offer
  // All Offer
  app.get("/offers", offer.findAllOffer);

  // Find One offer
  app.get("/offer/:id", offer.findOne);

  //Create offer
  app.post("/offer", offer.createOffer);

  //Update offer
  app.put("/offer/:id", offer.updateOffer);

  //Delete offer
  app.delete("/offer/:id", offer.deleteOffer);


  //Request
  // All Offer
  app.get("/requests", requests.findAllRequest);

  // Find One offer
  app.get("/request/:id", requests.findOne);

  //Create offer
  app.post("/request", requests.createRequest);

  //Update offer
  app.put("/request/:id", requests.updateRequest);

  //Delete offer
  app.delete("/request/:id", requests.deleteRequest);

  //Log Request

  //Log Offer

  //Type
};
