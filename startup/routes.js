const express = require("express");
// const genres = require("../routes/genres");
// const customers = require("../routes/customers");
// const movies = require("../routes/movies");
// const rentals = require("../routes/rentals");
const users = require("../routes/users");
const bookings = require("../routes/bookings");
const dogs = require("../routes/dogs");
const owners = require("../routes/owners");
const walkers = require("../routes/walkers");
// const auth = require("../routes/auth");
// const returns = require("../routes/returns");

// const helmet = require("helmet");
// const logger = require("../middleware/logger");
// const error = require("../middleware/error");

var cors = require("cors");
// GJ: the bleow is really used for PRODUCTION
const path = require("path");
const fs = require("fs");
const https = require("https");

module.exports = function (app) {
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    // GJ 02/09. USED FOR DEPLOYMENT - UNCOMMENT THE BELOW LINE PRODUCTION
    app.use(express.static(path.join(__dirname, "../client/build")));

    // GJ: COMMENT OUT THE BLEOW LINE FOR PRODUCTION
    //app.use(express.static("public"));
    app.use(cors());
    // app.use(helmet());
    // app.use(logger);
    // app.use(auth);
    // app.use("/api/genres", genres);
    // app.use("/api/customers", customers);
    // app.use("/api/movies", movies);
    // app.use("/api/rentals", rentals);
    app.use("/api/users", users);
    app.use("/api/bookings", bookings);
    app.use("/api/dogs", dogs);
    app.use("/api/owners", owners);
    app.use("/api/walkers", walkers);

    // app.use("/api/auth", auth);
    // app.use("/api/returns", returns);
    // app.use(error);
};
