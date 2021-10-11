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

const getOwnerProfile = async (ownerId) => {
    try {
        const ownerProfile = await Owner.getOwnerProfile(ownerId);
        return ownerProfile;
    } catch (error) {
        console.log("get owner profile controller" + error);
        return error;
    }
};

// This query obtains 1 owner from TABLE: owners
const getOwnerByCredentialId = async (credentialId) => {
    console.log("CREDENTIAL ID: ", credentialId);
    try {
        const owner = await Owner.getOwnerByCredentialId(credentialId);
        console.log("DO I HAVE AN OWNER???", owner);
        return owner;
    } catch (error) {
        console.log(
            "ownersController: Error from getOwnerByCredentialId()",
            error
        );
        return error;
    }
};

// // UPDATE THE OWNER. Pass all the paramters
// const updateOwner = async (ownerInfoDataObj) => {
//     try {
//         const newOwner = await Owner.update(ownerInfoDataObj);
//         console.log(
//             "owners.js -> updateOwner -> Success is if Row Count === 1: -->",
//             newOwner
//         );
//         return newOwner;
//     } catch (error) {
//         console.log("owners.js Error from updateOwner()", error);
//         return error;
//     }
// };

const updateProfile = async (profile) => {
    try {
        console.log(
            "ownersController.js -> updateProfile -> data is:",
            profile
        );
        const { data, error } = await Owner.updateProfile(profile);
        if (error) return { data: null, error: error };
        return { data, error: null };
    } catch (error) {
        console.log("error from update profile = " + error);
        return { data: null, error };
    }
};

module.exports = {
    getOwners,
    // updateOwner,
    getOwnerByCredentialId,
    updateProfile,
    getOwnerProfile
};
