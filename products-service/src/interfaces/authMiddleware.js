
const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../config');

module.exports = async function authMiddleware(event) {
  const headers = event.headers || {};
  const authHeader = headers.authorization || headers.Authorization;

  if (!authHeader) {
    return {
      statusCode: 401,
      body: JSON.stringify({ message: 'Authorization header missing' }),
    };
  }

  const token = authHeader.split(' ')[1];

  if (!token) {
    return {
      statusCode: 401,
      body: JSON.stringify({ message: 'Token not provided' }),
    };
  }

  try {
    jwt.verify(token, JWT_SECRET);
  } catch (err) {
    return {
      statusCode: 403,
      body: JSON.stringify({ message: 'Invalid token' }),
    };
  }

  return null;
};
