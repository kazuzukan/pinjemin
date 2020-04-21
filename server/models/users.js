"use strict";
module.exports = (sequelize, DataTypes) => {
  const users = sequelize.define(
    "users",
    {
      firstname: { type: DataTypes.STRING, allowNull: false },
      lastname: DataTypes.STRING,
      email: DataTypes.STRING,
      phone: DataTypes.STRING,
      address: DataTypes.TEXT,
      gender: DataTypes.BOOLEAN,
      password: DataTypes.STRING,
      point: DataTypes.INTEGER,
      isambassador: DataTypes.BOOLEAN,
    },
    {}
  );
  users.associate = function (models) {
    // associations can be defined here
    users.hasMany(models.product);
    users.hasMany(models.order);
    // users.hasMany(models.request);
  };
  return users;
};
