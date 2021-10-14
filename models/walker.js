const { runSql } = require("../db/runsSql");
const SQL = require("../db/usersSql.js");
const walkerSql = require("../db/walkerSql.js");
const User = require("./user");

const Walker = {};
//GJ: 07/09: The below simply obtains all completed bookings for the individual walker
Walker.getWalkerHistoricalCompletions = async (credential_id) => {
    console.log("models.js => getWallkerHistorialCopmletions");
    try {
        const walkerHistoricalData = await runSql(
            walkerSql.GET_WALKER_HISTORICAL_COMPLETIONS,
            [credential_id]
        );

        // just pass back the data rows
        const historicalData = walkerHistoricalData.rows;

        // return walkerHistoricalData;
        // return { data: { walkerHistoricalData }, error: null };
        return { data: { historicalData }, error: null };
    } catch (error) {
        console.log(
            "models.js => getWallkerHistorialCopmletions => Something wrong",
            error
        );
        return { data: null, error };
    }
};

//GJ: 07/09: GJ: The below query aggregates the walker's incomce by each service type
Walker.getWalkerHistoricalIncomeAggregation = async (tempWalkerID) => {
    // console.log("models.js => getWalkerHistoricalIncomeAggregation");
    try {
        const verificationData = await runSql(
            walkerSql.GET_WALKER_HISTORICAL_INCOME_AGGREGATION,
            [tempWalkerID]
        );
        // console.log("Do we have INCOME VERIFICADTION?", verificationData);
        // return verificationData;
        return { data: { verificationData }, error: null };
    } catch (error) {
        console.log(
            "models.js => getWalkerHistoricalIncomeAggregation => Something wrong",
            error
        );
        return { data: null, error };
    }
};

// GJ: 14/09: the below simply retrives teh assigned walks to the walker
Walker.getWalkerAssignedWalks = async (tempWalkerID) => {
    try {
        const verificationData = await runSql(
            walkerSql.GET_WALKER_ASSIGNED_WALKS,
            [tempWalkerID]
        );
        // console.log(
        //     "Do we have ASSIGNED WALK VERIFICADTION?",
        //     verificationData
        // );
        // return verificationData;
        return { data: { verificationData }, error: null };
    } catch (error) {
        console.log(
            "models.js => getWalkerAssignedWalks => Something wrong",
            error
        );
        return { data: null, error };
    }
};

Walker.updateProfile = async (profile) => {
    // console.log("User update profile = ", profile);
    const {
        id,
        type,
        email,
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
        size,
        serviceType,
        lat,
        lng,
        profileUrl,
    } = profile;

    // Need to make function
    let walker30HV = 1;
    let walker60HV = 1;
    let walker30WO = 1;
    let walker60WO = 1;

    if (serviceType.includes("Walks")) {
        walker30WO = 2;
        walker60WO = 4;
    }
    if (serviceType.includes("Home")) {
        walker30HV = 3;
        walker60HV = 5;
    }
    console.log("30WO = ", walker30WO);
    console.log("60WO = ", walker60WO);
    console.log("30HV = ", walker30HV);
    console.log("60HV = ", walker60HV);

    try {
        await runSql(walkerSql.UPDATE_WALKER, [
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
            walker30HV,
            walker60HV,
            walker30WO,
            walker60WO,
            lat,
            lng,
            profileUrl,
            size.sort().join(""), // PREFERENCES ALPHABETICALLY"LMS".
            id,
        ]);

        await runSql(SQL.UPDATE_USER_PROFILE, [id]);
        // TODO error checking update worked

        const token = User.generateAuthToken(
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

Walker.getWalkerPreferencesByCredentialId = async (credentialId) => {
    try {
        const {
            rows,
        } = await runSql(walkerSql.GET_WALKER_PREFERENCES_BY_CREDENTIAL_ID, [
            credentialId,
        ]);
        console.log("GOT 1 SPECIFIC WALKER?", rows);
        return rows[0];
    } catch (error) {
        console.log(error);
        return error;
    }
};

Walker.getWalkerProfile = async (credentialId) => {
    try {
        const {
            rows,
        } = await runSql(walkerSql.GET_WALKER_POFILE_BY_CREDENTIAL_ID, [
            credentialId,
        ]);

        return rows[0];
    } catch (error) {
        console.log(error);
        return error;
    }
};

Walker.getWalker = async (credentialId) => {
    try {
        console.log("***************************");
        console.log("walker.getWalker ->", credentialId);
        const { rows } = await runSql(walkerSql.GET_WALKER, [credentialId]);
        return rows[0];
    } catch (error) {
        console.log(error);
        return error;
    }
};

module.exports = Walker;
