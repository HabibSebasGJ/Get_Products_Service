const { getProducts } = require('../application/useCases');
const verifyToken = require('./authMiddleware');

exports.handler = async (event) => {
  const user = verifyToken(event.headers || {});

  if (!user) {
    return {
      statusCode: 401,
      body: JSON.stringify({ message: 'No autorizado' })
    };
  }

  try {
    const products = await getProducts();

    return {
      statusCode: 200,
      body: JSON.stringify({ data: products })
    };
  } catch (err) {
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error interno del servidor', error: err.message })
    };
  }
};
