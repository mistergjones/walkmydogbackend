const jwt = require("jsonwebtoken");
// const config = require("config");
const { runSql } = require("../db/runsSql");
const SQL = require("../db/ownersSql.js");
const ownerSql = require("../db/ownersSql.js");
const dogSql = require("../db/dogsSql");

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
Owner.update = async (ownerInfoDataObj) => {
    try {
        // destructure the object ready for insertion
        const {
            firstname,
            lastname,
            streetAddress,
            suburb,
            postcode,
            mobile,
            dob,
            driverLicence,
            bankName,
            bsb,
            accountNumber,
            credential_id,
        } = ownerInfoDataObj;

        const rows = await runSql(ownerSql.UPDATE_OWNER, [
            firstname,
            lastname,
            streetAddress,
            suburb,
            postcode,
            mobile,
            dob,
            driverLicence,
            bankName,
            bsb,
            accountNumber,
            credential_id,
        ]);

        // update the IS_PROFILE ESTABLISHED in TABLE CREDENTIALS to TRUE
        // await runSql(SQL.UPDATE_USER_PROFILE, [credential_id]);

        // GJ: its a successful insert if rows.rowCount = 1. i.e. no data to give back
        console.log(
            "models.js -> UPDATE OWNER: SUCCESS IS ROWS COUNT = 1",
            rows.rowCount
        );
        return rows.rowCount;
    } catch (error) {
        console.log("Error in: /models/owner.js", error);
        console.log("******************");
        console.log(error.error.detail);
    }
};
// This function will update the TABLE: OWNER with form submitted fields. TABLE: DOGS with submitted fields and SET is_profile_established to TRUE in TABLE: CREDENTIALS.
// It will also return token back
Owner.updateProfile = async (profile) => {
    console.log("Owner update profile = ", profile);
    const {
        firstname,
        lastname,
        streetAddress,
        suburb,
        state,
        postcode,
        mobile,
        dob,
        driverLicence,
        bankName,
        bsb,
        accountNumber,
        id,
        type,
        email,
        dogName,
        dogSize,
        dogBreed,
        requiresLeash,
        lat,
        lng,
        owner_id,
    } = profile;
    try {
        var insertingOwnerResponse = await runSql(ownerSql.UPDATE_OWNER, [
            firstname,
            lastname,
            streetAddress,
            suburb,
            state,
            postcode,
            mobile,
            dob,
            driverLicence,
            bankName,
            bsb,
            accountNumber,
            lat,
            lng,
            id,
        ]);
        console.log("INSERTING OWNER", insertingOwnerResponse);

        // Need to insert the dog information after the owner:
        var insertingDogOwnerResponse = await runSql(dogSql.INSERT_DOG, [
            dogName,
            dogBreed,
            dogSize,
            requiresLeash,
            owner_id,
        ]);
        console.log("INSERTING DOG", insertingDogOwnerResponse);

        // set hasprofile to TRUE in TABLE: CREDENTIALS
        await runSql(ownerSql.UPDATE_USER_PROFILE, [id]);
        // TODO error checking update worked

        const token = Owner.generateAuthToken(
            id,
            type,
            email,
            true,
            firstname,
            lastname
        );
        console.log("user update profile token = ", token);
        return { data: { token }, error: null };
    } catch (error) {
        console.log(error);
        return { data: null, error };
    }
};

//GJ: 17/08/21 Copied this function from Peter's code.
Owner.generateAuthToken = (id, type, email, profile, firstname, lastname) => {
    console.log("id = ", id);
    const token = jwt.sign(
        { id, type, email, hasProfile: profile, firstname, lastname },
        "1111"
        // config.get("jwtPrivateKey")
    );
    return token;
};

module.exports = Owner;
