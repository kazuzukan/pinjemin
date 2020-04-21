'use strict';
module.exports = (sequelize, DataTypes) => {
  const bank = sequelize.define('bank', {
    name: DataTypes.STRING,
    number: DataTypes.STRING,
    status: DataTypes.BOOLEAN
  }, {});
  bank.associate = function(models) {
    // associations can be defined here
  };
  return bank;
};