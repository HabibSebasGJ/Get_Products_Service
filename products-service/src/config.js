require('dotenv').config();

module.exports = {
  JWT_SECRET: process.env.JWT_SECRET || 'i3876538~i$5',
  PRODUCTS_TABLE: process.env.PRODUCTS_TABLE || 'Products',
};
