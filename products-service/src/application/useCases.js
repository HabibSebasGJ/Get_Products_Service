const ProductRepository = require('../infrastructure/productRepository');

async function getProducts() {
  const repo = new ProductRepository();
  return await repo.getAll();
}

module.exports = { getProducts };
