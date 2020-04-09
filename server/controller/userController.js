const User = require('../models/userModel');

exports.findAll = (req, res) => {
   User.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving  req.body.",
      });
    } else res.send(data);
  });
};

exports.findOne = (req, res) => {
   User.getById(req.params.userId, (err, data) => {
    if (err) { 
      if (err.not === "not_found") {
        res.status(404).send({
          message: `Not found User with user id ${req.params.userId}.`,
        });
      } else {
        res.status(500).send({
          message: `Not found User ${req.params.userId}.`,
        });
      }
    } else res.send(data);
  });
};

exports.createUser = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  //constructor 
  const user = new User({
    first_name:  req.body.first_name,
    last_name:  req.body.last_name,
    address: req.body.address,
    phone:  req.body.phone,
    gender:  req.body.gender,
    email:  req.body.email,
    password:  req.body.password,
    point:  req.body.point,
    is_ambassador:  req.body.is_ambassador
  });

  User.creareUser(user, (err, data) => {
    if(err){
      res.status(500).send({
        message : 
          err.message || "error euuy"
      })
    }
    else res.send(data)
  })
}