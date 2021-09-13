const express = require("express");
const app = express();

// GJ 02/09: required for client build stuff. USED FOR DEPLOYMENT
const path = require("path");

// const winston = require("winston");

// require("./startup/logging")();
// require("./startup/config")();
require("./startup/routes")(app);
// require("./startup/db")();
// require("./startup/validation")();
// require("./startup/debug")(app);

// GJ 02/09. USED FOR DEPLOYMENT
//app.use(express.static(path.join(__dirname, "./client/build")));

const port = process.env.PORT || 3000;
const server = app.listen(port, () =>
    console.log(`Listening on Port ${port}...`)
);

module.exports = server;
