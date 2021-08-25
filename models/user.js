const jwt = require("jsonwebtoken");
// const config = require("config");
const { runSql } = require("../db/runsSql");
const SQL = require("../db/usersSql.js");
const walkerSql = require("../db/walkerSql.js");


// USED FOR EXPORTING THE FUNCTIONS BELOW
const User = {};

// 01/08/2021: GJ: This is called when a user SIGNS UP. It inserts a user into TABLE: CREDENTIALS
User.create = async (email, hashedPassword, type) => {
    try {
        // 1.0 checking if user alrady exists via email
        const { rows: rowsBefore } = await runSql(SQL.GET_USER_BY_EMAIL, [
            email,
        ]);

        console.log("rows before = ", rowsBefore.length);
        // 2.0 If the email does EXIST, return an error message
        if (rowsBefore.length > 0)
            return { user: null, token: null, error: "user already exists" };

        // 3.0 if no error, insert the user
        const result = await runSql(SQL.INSERT_USER_INTO_CREDENTIALS, [
            email,
            hashedPassword,
            type,
        ]);

        console.log(result);

        // 4.0 Obtain user details from TABLE: CREDENTIALS
        const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);

        console.log("User.create = ", rows);
        // return the first row as an array
        // return rows[0];

        const user = rows[0];
        console.log("%%%% user = ", user);

        //14:07/21 PH MOVED GENERATE AUTH TOKEN TO CONTROLLER
        return { data: { user }, error: null };
    } catch (error) {
        console.log("User.Create()" + error);
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

// PH 06/07/21 Method is only responsible for running query and
// returning result
User.getUserByEmail = async (email) => {
    try {
        const { rows: user } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);
        return { data: { user: user }, error: null };
    } catch (error) {
        console.log(error);
        return { data: null, error };
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

        const token = User.generateAuthToken(
            rows[0].credential_id,
            rows[0].type,
            rows[0].email,
            false,
            firstname,
            lastname,
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



//PH: 14/07/21 ADDED Firstname and lastname to token.
User.generateAuthToken = (id, type, email, profile, firstname, lastname) => {
    console.log("first name = ", firstname);
    if (!id || !type || !email || !firstname || !lastname) {
        console.log("error with data supplied generate token");
        throw new Error("There has been an error in generate auth token.")
    }

    const token = jwt.sign(
        { id, type, email, hasProfile: profile, firstname, lastname },
        "1111"
        // config.get("jwtPrivateKey")
    );
    return token;
};

// GET USER INFO DEPENDING ON TYPE.
//PH: 14/07/21
User.getUserDetails = async (id, type) => {
    console.log("id = " + id, " type = " + type);
    let info = {};
    let error = null;

    if (type === "W") {
        const { rows } = await runSql(walkerSql.GET_WALKER, [id]);

        // SQL CALL SHOULD RETURN ONE ROW
        if (rows.length !== 1) {
            error = "error from get user details.";

        } else {
            info = rows[0];

        }
    } else if (type === "O") {
        //TODO:
    }
    console.log("error getuserdetails == " + error)
    return { data: { userDetails: info }, error };
};

module.exports = User;
