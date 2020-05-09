module.exports = (app) => {
  const user = require("../controller/userController");
  const product = require("../controller/productController");
  const section = require("../controller/sectionController");
  const order = require("../controller/orderController");

  // Default
  app.get("/", (req, res) => {
    res.json({ Hello: "Welcome to Pinjemin Apps." });
  });

  // Customer
  // All User
  app.get("/user", user.findAllUser);

  // User Product
  app.get("/userproduct/:id", user.findUserProduct);

  // User Order
  app.get("/userorder/:id", user.findUserOrder);

  // Find One User
  app.get("/user/:id", user.findOne);

  //Create User
  app.post("/user", user.createUser);

  //Update User
  app.put("/user/:id", user.updateUser);

  //Delete User
  app.delete("/user/:id", user.deleteUser);

  //Product
  // All product
  app.get("/product", product.findAllProduct);

  // Product with section information
  app.get("/product-section", product.findwithSection);

  // All Request product
  app.get("/request-product", product.findRequestProduct);

  // Find One product
  app.get("/product/:id", product.findOne);

  // Create product
  app.post("/product", product.createProduct);

  // Update product
  app.put("/product/:id", product.updateProduct);

  // Delete product
  app.delete("/product/:id", product.deleteProduct);

  // Section
  // Find All Section
  app.get("/section", section.findAllSection);

  // Find All Request product in section
  app.get("/request-section", section.findRequestSection);

  // Find All Request product in section
  app.get("/offer-section", section.findOfferSection);

  // Create Product Section
  app.post("/section", section.createSection);

  // Update Product Section 
  app.put("/section/:id", section.updateSection);

  //delete Product Section
  app.delete("/section/:id", section.deleteSection);

  //Order
  // All Order
  app.get("/order", order.findAllOrder);

  // create Order
  app.post("/order", order.createOrder);

  // Update Order 
  app.put("/order/:id", order.updateOrder);

  //delete Order
  app.delete("/order/:id", order.deleteOrder);
};
