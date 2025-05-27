class Product {
  constructor({ uuid, name, brand, categories, price }) {
    this.uuid = uuid;
    this.name = name;
    this.brand = brand;
    this.categories = categories;
    this.price = price;
  }
}

module.exports = Product;
