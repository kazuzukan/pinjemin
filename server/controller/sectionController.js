const db = require("../models");
const Section = db.section;
// const Op = db.sequelize.Op;


exports.createSection = (req, res) => {
  //constructor
  const section = {
    startDate: req.body.startDate,
    endDate: req.body.endDate,
    type: req.body.type,
    productId: req.body.productId
  };

  Section.create(section)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error udpate User with id =" + id,
      });
    });
};

exports.findAllSection = (req, res) => {
  Section.findAll()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.findRequestSection = (req, res) => {
  Section.findAll({
    where: {type: 0},
    include: [
      {
        model: db.product,
      },
    ],
  }
  )
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.findOfferSection = (req, res) => {
  Section.findAll({
    where: {type: 1},
    include: [
      {
        model: db.product,
      },
    ],
  }
  )
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Users.",
      });
    });
};

exports.updateSection = (req, res) => {
  const id = req.params.id;

  //constructor
  const section = {
    startDate: req.body.startDate,
    endDate: req.body.endDate,
    type: req.body.type,
    productId: req.body.productId
  };

  Section.update(section, {
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

exports.deleteSection = (req, res) => {
  const id = req.params.id;

  Section.destroy({
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
