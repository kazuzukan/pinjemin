'use strict';
module.exports = (sequelize, DataTypes) => {
  const request = sequelize.define('request', {
    name: DataTypes.STRING,
    desc: DataTypes.TEXT,
    startDate: DataTypes.DATE,
    endDate: DataTypes.DATE
  }, {});
  request.associate = function(models) {
    // associations can be defined here
    request.belongsTo(models.users);
  };
  return request;
};