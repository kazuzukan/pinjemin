const db = require("../models");
const Product = db.product;
// const Op = db.sequelize.Op;

exports.findwithSection = (req, res) => {
  Product.findAll({
    include: [
      {
        model: db.section,
      },
    ],
  })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.findAllProduct = (req, res) => {
  Product.findAll()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.findRequestProduct = (req, res) => {
  Product.findAll({
    include: [
      {
        model: db.section
      },
    ],
  })
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

  Product.findByPk(id, {
    include: [
      {
        model: db.section,
      },
    ],
  })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error retrieving User with id =" + id,
      });
    });
};

exports.createProduct = (req, res) => {
  //constructor
  const product = {
    name: req.body.name,
    desc: req.body.desc,
    method: req.body.method,
    price: req.body.price,
    duration: req.body.duration,
    image: req.body.image,
    userId: req.body.userId,
  };

  Product.create(product)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error udpate User with id =" + id,
      });
    });
};

exports.updateProduct = (req, res) => {
  const id = req.params.id;

  //constructor
  const product = {
    name: req.body.name,
    desc: req.body.desc,
    method: req.body.method,
    price: req.body.price,
    duration: req.body.duration,
    email: req.body.email,
    password: req.body.password,
    point: req.body.point,
    isambassador: req.body.isambassador,
  };

  Product.update(product, {
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

exports.deleteProduct = (req, res) => {
  const id = req.params.id;

  Product.destroy({
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
