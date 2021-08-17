// REQUIRE MODEL
const Owner = require("../models/owner.js");

// Require helper functions to determine if data is good before database insertion
const DataValidation = require("../helpers/databaseFieldValidations");

// GET ALL owners
const getOwners = async () => {
    // just get the OWNERSS only
    try {
        const owners = await Owner.get();

        return owners;
    } catch (error) {
        console.log("ownersController: Error from getOwner()", error);
        return error;
    }
};

const getOwnerByCredentialId = async (credentialId) => {
    // just get 1 owner only only
    try {
        const owner = await Owner.getOwnerByCredentialId(credentialId);

        return owner;
    } catch (error) {
        console.log(
            "ownersController: Error from getOwnerByCredentialId()",
            error
        );
        return error;
    }
};

// UPDATE THE OWNER. Pass all the paramters
const updateOwner = async (
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
        const newOwner = await Owner.update(
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
        );
        console.log("owners.js -> updateOwner -> ", newOwner);
        return newOwner;
    } catch (error) {
        console.log("owners.js Error from updateOwner()", error);
        return error;
    }
};

module.exports = {
    getOwners,
    updateOwner,
    getOwnerByCredentialId,
};
