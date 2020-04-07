const User = require("../models/userModel");

exports.findAll = (req, res) => {
  User.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving user.",
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
