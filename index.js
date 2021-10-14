const express = require("express");
const app = express();

// GJ 02/09: required for client build stuff. USED FOR PRODUCTON
const path = require("path");
const fs = require("fs");
const https = require("https");

// const winston = require("winston");

// require("./startup/logging")();
// require("./startup/config")();
require("./startup/routes")(app);
// require("./startup/db")();
// require("./startup/validation")();
// require("./startup/debug")(app);

// const port = process.env.PORT || 3000;
// const server = app.listen(port, () =>
//     console.log(`Listening on Port ${port}...`)
// );

// module.exports = server;

// ************************************************************************************
// GJ: PRODUCTION SERVER DETAILS

// GJ 02/09. USED FOR PRODUCTION
app.use(express.static(__dirname, { dotfiles: "allow" }));
app.use(express.static(path.join(__dirname, "./client/build")));

const server = https
    .createServer(
        {
            key: fs.readFileSync(
                "/etc/letsencrypt/archive/walkmd.ddns.net/privkey1.pem"
            ),
            cert: fs.readFileSync(
                "/etc/letsencrypt/archive/walkmd.ddns.net/cert1.pem"
            ),
            ca: fs.readFileSync(
                "/etc/letsencrypt/archive/walkmd.ddns.net/chain1.pem"
            ),
        },
        app
    )
    .listen(443, () => {
        console.log("Listening...");
    });

module.exports = server;

// GJ: THE BELOW PORT IS USED WHEN ACCESSING THE SOLUTION LOCALLY

// //const port = process.env.PORT || 80;
// //const server = app.listen(port, () =>
// //    console.log(`Listening on Port ${port}...`)
// //);
