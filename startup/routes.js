const express = require("express");
// const genres = require("../routes/genres");
// const customers = require("../routes/customers");
// const movies = require("../routes/movies");
// const rentals = require("../routes/rentals");
const users = require("../routes/users");
const bookings = require("../routes/bookings");
// const auth = require("../routes/auth");
// const returns = require("../routes/returns");

// const helmet = require("helmet");
// const logger = require("../middleware/logger");
// const error = require("../middleware/error");

module.exports = function (app) {
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(express.static("public"));
    // app.use(helmet());
    // app.use(logger);
    // app.use(auth);
    // app.use("/api/genres", genres);
    // app.use("/api/customers", customers);
    // app.use("/api/movies", movies);
    // app.use("/api/rentals", rentals);
    app.use("/api/users", users);
    app.use("/api/bookings", bookings);
    // app.use("/api/auth", auth);
    // app.use("/api/returns", returns);
    // app.use(error);
};