"use strict";
module.exports = (sequelize, DataTypes) => {
  const offer = sequelize.define(
    "offer",
    {
      name: DataTypes.STRING,
      method: DataTypes.STRING,
      desc: DataTypes.TEXT,
      price: DataTypes.INTEGER,
      duration: DataTypes.STRING,
      image: DataTypes.STRING,
    },
    {}
  );
  offer.associate = function (models) {
    // associations can be defined here
    offer.belongsTo(models.users);
  };
  return offer;
};
