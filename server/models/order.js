'use strict';
module.exports = (sequelize, DataTypes) => {
  const order = sequelize.define('order', {
    name: DataTypes.STRING,
    address: DataTypes.TEXT,
    starDate: DataTypes.DATE,
    endDate: DataTypes.DATE,
    point: DataTypes.INTEGER,
    status: DataTypes.STRING
  }, {});
  order.associate = function(models) {
    // associations can be defined here
    order.belongsTo(models.users)
    order.belongsTo(models.product)
  };
  return order;
};