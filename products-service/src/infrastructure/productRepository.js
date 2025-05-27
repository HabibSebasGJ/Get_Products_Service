const AWS = require('aws-sdk');
const Product = require('../domain/Product');
const { PRODUCTS_TABLE } = require('../config');

const dynamo = new AWS.DynamoDB.DocumentClient();

class ProductRepository {
  async getAll() {
    const params = {
      TableName: PRODUCTS_TABLE,
    };

    const result = await dynamo.scan(params).promise();

    return result.Items.map(
      item => new Product({
        uuid: item.uuid,
        name: item.name,
        brand: item.brand,
        categories: item.categories,
        price: item.price
      })
    );
  }
}

module.exports = ProductRepository;
