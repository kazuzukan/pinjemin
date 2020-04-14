const db = require("../models");
const User = db.request;
// const Op = db.sequelize.Op;

exports.findAllRequest = (req, res) => {
  User.findAll()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;

  User.findByPk(id)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error retrieving User with id =" + id,
      });
    });
};

exports.createRequest = (req, res) => {
  //constructor
  const user = {
    name: req.body.name,
    method: req.body.method,
    desc: req.body.desc,
    price: req.body.price,
    image: req.body.image,
    userId: req.body.userId,
  };

  User.create(user)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error udpate User with id =" + id,
      });
    });
};

exports.updateRequest = (req, res) => {
  const id = req.params.id;

  //constructor
  const user = {
    name: req.body.name,
    method: req.body.method,
    desc: req.body.desc,
    price: req.body.price,
    image: req.body.image,
    userId: req.body.userId,
  };

  User.update(user, {
    where: {
      id: id,
    },
  })
    .then((data) => {
      res.json({
        message: "user updated",
      });
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error udpate User with id =" + id,
      });
    });
};

exports.deleteRequest = (req, res) => {
  const id = req.params.id;

  User.destroy({
    where: {
      id: id,
    },
  })
    .then((data) => {
      res.send({ message: `${data} user deleted` });
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all tutorials.",
      });
    });
};
