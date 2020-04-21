const db = require("../models");
const Order = db.order;
// const Op = db.sequelize.Op;

exports.findAllOrder = (req, res) => {
  Order.findAll()
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

  Order.findByPk(id)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error retrieving User with id =" + id,
      });
    });
};

exports.createOrder = (req, res) => {
  //constructor
  const order = {
    name: req.body.name,
    address: req.body.address,
    starDate: req.body.starDate,
    endDate: req.body.endDate,
    point: req.body.point,
    status: req.body.status,
    userId: req.body.userId,
    productId: req.body.productId
  };

  Order.create(order)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error udpate User with id =" + id,
      });
    });
};

exports.updateOrder = (req, res) => {
  const id = req.params.id;

  //constructor
  const order = {
    name: req.body.name,
    address: req.body.address,
    starDate: req.body.starDate,
    endDate: req.body.endDate,
    point: req.body.point,
    status: req.body.status,
    userId: req.body.userId,
    productId: req.body.productId
  };

  Order.update(order, {
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

exports.deleteOrder = (req, res) => {
  const id = req.params.id;

  Order.destroy({
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
