const jwt = require("jsonwebtoken");
// const config = require("config");
const { runSql } = require("../db/runsSql");
const SQL = require("../db/ownersSql.js");

// USED FOR EXPORTING THE FUNCTIONS BELOW
const Owner = {};

// GET ALL OWNERS FROM OWNER TABLE
Owner.get = async () => {
    try {
        const { rows } = await runSql(SQL.GET_OWNERS, []);
        console.log("GOT ALL OWNERS?", rows);
        return { owners: rows };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// GET 1 OWNER
Owner.getOwnerByCredentialId = async (credentialId) => {
    try {
        const { rows } = await runSql(SQL.GET_OWNER_BY_CREDENTIAL_ID, [
            credentialId,
        ]);
        console.log("GOT 1 SPECIFIC OWNER?", rows);
        return { owner: rows };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// UPDATE THE OWNER WITH THEIR PROFILE INFORMATION
Owner.update = async (
    firstname,
    lastname,
    streetAddress,
    suburb,
    postcode,
    mobile,
    dob,
    driverLicence,
    bankName,
    BSB,
    accountNumber
) => {
    try {
        const rows = await runSql(SQL.UPDATE_OWNER, [
            firstname,
            lastname,
            streetAddress,
            suburb,
            postcode,
            mobile,
            dob,
            driverLicence,
            bankName,
            BSB,
            accountNumber,
        ]);

        // GJ: its a successful insert if rows.rowCount = 1. i.e. no data to give back
        console.log("models/owner LINE 65", rows.rowCount);
        return rows.rowCount;
    } catch (error) {
        console.log("Error in: /models/owner.js", error);
        console.log("******************");
        console.log(error.error.detail);
    }
};

module.exports = Owner;
