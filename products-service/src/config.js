require('dotenv').config();

module.exports = {
  JWT_SECRET: process.env.JWT_SECRET || 'my-super-secret',
  PRODUCTS_TABLE: process.env.PRODUCTS_TABLE || 'Products',
};
