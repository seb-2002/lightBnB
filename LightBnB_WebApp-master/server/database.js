const properties = require("./json/properties.json");
const users = require("./json/users.json");

const { Pool } = require("pg");
const { query } = require("express");

const pool = new Pool({
  user: "vagrant",
  password: 123,
  host: "localhost",
  database: "lightbnb",
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  return pool
    .query(
      `
  SELECT * 
  FROM users
  WHERE email = $1
  `,
      [email]
    )
    .then((res) => {
      if (res.rows.length < 1) {
        return null;
      } else {
        return res.rows[0];
      }
    })
    .catch((err) => console.error(err));
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return pool
    .query(
      `
  SELECT *
  FROM users
  WHERE id = $1
  `,
      [id]
    )
    .then((res) => {
      return res.rows[0];
    })
    .catch((err) => console.error(err));
};
exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
// const addUser = function (user) {
//   const userId = Object.keys(users).length + 1;
//   user.id = userId;
//   users[userId] = user;
//   return Promise.resolve(user);
// };

const addUser = function (user) {
  const vals = [user.name, user.email, user.password];

  return pool
    .query(
      `
  INSERT INTO users
  (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `,
      vals
    )
    .then((res) => {
      return res.rows[0];
    })
    .catch((err) => console.error(err));
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
// const getAllReservations = function (guest_id, limit = 10) {
//   return getAllProperties(null, 2);
// };
const getAllReservations = function (guest_id, limit = 10) {
  return pool
    .query(
      `
  SELECT reservations.*, properties.*, avg(rating) AS average_rating 
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON reservations.id = property_reviews.reservation_id
  WHERE reservations.guest_id = $1
  AND end_date < now()::date
  GROUP BY properties.id, reservations.id
  ORDER BY start_date
  LIMIT $2;
    `,
      [guest_id, limit]
    )
    .then((res) => {
      return res.rows;
    })
    .catch((err) => console.error(err));
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function (options, limit = 10) {
  const queryParams = [];

  let queryString = `
SELECT properties.*, avg(property_reviews.rating) AS avg_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
`;

  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length}`;
  }

  if (options.owner_id) {
    if (queryParams.length < 1) {
      queryParams.push(options.owner_id);
      queryString += `WHERE owner_id = $${queryParams.length}`;
    } else {
      queryParams.push(options.owner_id);
      queryString += `
      AND owner_id = $${queryParams.length}`;
    }
  }

  if (options.minimum_price_per_night) {
    if (queryParams.length < 1) {
      queryParams.push(options.minimum_price_per_night);
      queryString += `WHERE cost_per_night >= $${queryParams.length}`;
    } else {
      queryParams.push(options.minimum_price_per_night);
      queryString += `
      AND cost_per_night >= $${queryParams.length}`;
    }
  }
  if (options.maximum_price_per_night) {
    if (queryParams.length < 1) {
      queryParams.push(options.maximum_price_per_night);
      queryString += `WHERE cost_per_night <= $${queryParams.length}`;
    } else {
      queryParams.push(options.maximum_price_per_night);
      queryString += `
      AND cost_per_night <= $${queryParams.length}`;
    }
  }

  queryString += `
GROUP BY properties.id`;

  if (options.minimum_rating) {
    queryParams.push(parseFloat(options.minimum_rating));
    queryString += `
  HAVING avg(property_reviews.rating) >= $${queryParams.length}`;
  }

  queryParams.push(limit);

  queryString += `
ORDER BY cost_per_night
LIMIT $${queryParams.length};
`;

  console.log(queryString, queryParams);

  return pool
    .query(queryString, queryParams)
    .then((res) => {
      return res.rows;
    })
    .catch((err) => console.error(err));
};
exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const vals = [];
  for (let key in property) {
    vals.push(property[key]);
  }

  return pool
    .query(
      `
      INSERT INTO properties
      (title, description, number_of_bedrooms, number_of_bathrooms, parking_spaces, cost_per_night, thumbnail_photo_url, cover_photo_url, street, country,  city, province, post_code, owner_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
      RETURNING *;
      `,
      vals
    )
    .then((res) => {
      return res.rows[0];
    })
    .catch((err) => console.error(err));
};
exports.addProperty = addProperty;
