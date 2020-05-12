'use strict';
module.exports = (sequelize, DataTypes) => {
  const section = sequelize.define('section', {
    startDate: DataTypes.STRING,
    endDate: DataTypes.STRING,
    type: DataTypes.INTEGER
  }, {});
  section.associate = function(models) {
    // associations can be defined here
    section.belongsTo(models.product);
  };
  return section;
};