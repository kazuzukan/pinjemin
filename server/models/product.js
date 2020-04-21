'use strict';
module.exports = (sequelize, DataTypes) => {
  const product = sequelize.define('product', {
    name: DataTypes.STRING,
    desc: DataTypes.TEXT,
    method: DataTypes.STRING,
    price: DataTypes.INTEGER,
    duration: DataTypes.STRING,
    image: DataTypes.STRING
  }, {});
  product.associate = function(models) {
    // associations can be defined here
    product.belongsTo(models.users);
    product.hasOne(models.section);
    product.hasMany(models.order);
  };
  return product;
};