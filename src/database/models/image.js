'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Image extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      
    }
  }
  Image.init({
    name: { type: DataTypes.STRING, allowNull: false},
    id_product: {type: DataTypes.INTEGER, allowNull: false},

  }, {
    sequelize,
    modelName: 'Image',
  });
  return Image;
};