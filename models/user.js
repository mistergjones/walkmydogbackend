const jwt = require("jsonwebtoken");
// const config = require("config");
const { runSql } = require("../db/runsSql");
const SQL = require("../db/usersSql.js");

// USED FOR EXPORTING THE FUNCTIONS BELOW
const User = {};

// 01/08/2021: GJ: attempting to insert a user into the CRDENTIALS table
User.create = async (email, hashedPassword, type) => {
    try {
        // checking if user alrady exists via email
        const { rows: rowsBefore } = await runSql(SQL.GET_USER_BY_EMAIL, [
            email,
        ]);
        console.log("rows before = ", rowsBefore.length);
        // if the email does EXIST, return an error message
        if (rowsBefore.length > 0)
            return { user: null, token: null, error: "user already exists" };

        // if not error, inser the user
        await runSql(SQL.INSERT_USER_INTO_CREDENTIALS, [
            email,
            hashedPassword,
            type,
        ]);

        const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);
        // return the first row as an array
        // return rows[0];
        const token = generateAuthToken(
            rows[0].credential_id,
            rows[0].type,
            rows[0].email,
            false
        );

        return { user: rows[0], token };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// GET ALL USERS
User.get = async () => {
    try {
        const { rows } = await runSql(SQL.GET_USERS, []);
        return { users: rows };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// GET SINGLE USER
User.getUserByEmail = async (email) => {
    try {
        const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);

        const token = generateAuthToken(
            rows[0].credential_id,
            rows[0].type,
            rows[0].email,
            true
        );
        return { user: rows[0], token };
    } catch (error) {
        console.log(error);
        return error;
    }
};

User.getUserById = async (id) => {
    try {
        const { rows } = await runSql(SQL.GET_USER_BY_ID, [id]);
        return { user: rows };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// GJ: IF SIGNING UP a NEW USER, NEED TO UPDATE WALKER OR OWNER based on TYPE
User.update = async (
    firstname,
    lastname,
    mobile,
    email,
    credential_id,
    type
) => {
    // DETERMINE WHICH TABLE TO UPDATE BASED ON THE INSERTION OF A NEW USER INTO CREDENTIALS
    try {
        if (type == "W") {
            await runSql(SQL.INSERT_WALKER, [
                firstname,
                lastname,
                mobile,
                email,
                credential_id,
            ]);
        } else {
            await runSql(SQL.INSERT_OWNER, [
                firstname,
                lastname,
                mobile,
                email,
                credential_id,
            ]);
        }
        // await runSql(SQL.INSERT_WALKER, [
        //     firstname,
        //     lastname,
        //     mobile,
        //     email,
        //     credential_id,
        // ]);
        // now return a record set back to calling function. We may use this data
        const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);

        const token = generateAuthToken(
            rows[0].credential_id,
            rows[0].type,
            rows[0].email,
            false
        );

        return { user: rows[0], token };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// DELETE A USER
User.delete = async (id) => {
    try {
        await runSql(SQL.DELETE_USER, [id]);
        return { userId: id };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// VALIDATE USER

User.validate = (user) => {
    // MAYBE USE YUP FOR VALIDATION SCHEMA
    return true;
};

User.updateProfile = (profile) => {
    console.log("User update profile = ", profile);
    const { id, type, email, phone } = profile;
    try {
        // const result = await runSql(SQL.UPDATE_PROFILE, [phone]);
        const token = generateAuthToken(id, type, email, true);
        console.log("user update profile token = ", token);
        return token;
    } catch (error) {
        console.log(error);
        return error;
    }
};

generateAuthToken = function (id, type, email, profile) {
    const token = jwt.sign(
        { id: id, type: type, email, hasProfile: profile },
        "1111"
        // config.get("jwtPrivateKey")
    );
    return token;
};
module.exports = User;
