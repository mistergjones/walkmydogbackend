// REQUIRE MODEL
const User = require("../models/user.js");
// Require BCRYPT for encrypting the password
const bcrypt = require("bcryptjs");
// Require helper functions to determine if data is good before database insertion
const DataValidation = require("../helpers/databaseFieldValidations");

// GET ALL USERS
const getUsers = async () => {
    try {
        const users = await User.get();

        return users;
    } catch (error) {
        console.log("Error from getUser()", error);
        return error;
    }
};
// GET SINGLE USER BY EMAIL

//PH 06/07/21 CALL USER MODEL GET USER BY EMAIL
// IF CALL DOESN'T RECEIVE A USER OR THE LENGHT IS NOT EQUAL TO 1
// RETURN ERROR MSG OTHERWISE RETURN USER AND ERROR IS NULL.

const getUserByEmail = async (email) => {
    try {
        const { data, error } = await User.getUserByEmail(email);

        if (error) return { data: null, error };
        // Check we have user and is only one entry
        const { user } = data;

        if (!user || user.length !== 1) {
            return { data: null, error: "EMAIL NOT RETRIEVED" };
        }

        console.log(user[0])
        // PH : 14/07 21 GET First Name & LAST Name of owner or walker.
        const { data: userInfo, error: userInfoError } = await User.getUserDetails(
            user[0].credential_id,
            user[0].type
        );
        if (userInfoError) {
            return { data: null, error: userInfoError }
        }
        return {
            data: { user: { ...user[0], ...userInfo.userDetails } },
            error: null,
        };
    } catch (error) {
        console.log("Error from getUserByEmail()", error);
        return { data: null, error };
    }
};
// GET SINGLE USER BY ID
const getUserById = async (id) => {
    try {
        const user = await User.getUserById(id);
        return user;
    } catch (error) {
        console.log("Error from getUserById()", error);
        return error;
    }
};

// CREATE USER
const createUser = async (username, password) => {
    // NEED VALIDATION LOGIC HERE
    if (!User.validate(username)) return "Validation error";

    try {
        const user = await User.create(username, password);
        return user;
    } catch (error) {
        console.log("Error from createUser()", error);
        return error;
    }
};

// UPDATE USER
const updateUser = async (id, email) => {
    // NEED VALIDATION LOGIC HERE
    if (!User.validate(email)) return "Validation error";

    try {
        const user = await User.update(id, email);
        return user;
    } catch (error) {
        console.log("Error from updateUser()", error);
        return error;
    }
};

// DELETE USER
const deleteUser = async (id) => {
    try {
        const userId = await User.delete(id);
        return userId;
    } catch (error) {
        console.log("Error from deleteUser()", error);
        return error;
    }
};

// 01/08: GJ: inserting user details into TABLE: CREDENTIALS ON SIGNUP
const insertUser = async (email, password, type, firstname, lastname) => {
    try {
        // 1.0 Check if firstname and lastname fields contain valid LETTERS only
        if (
            DataValidation.checkValidInputFields(firstname, lastname) === false
        ) {
            return {
                user: null,
                token: null,
                error: "Please ensure letters only in Firstname and Lastname",
            };
        }

        // 2.0 Check if INVALID email address. If so, return ERROR MESSAGE OBJECT
        DataValidation.checkValidEmailAddress(email);

        // 1.0 need to hash the password before insertion
        var salt = bcrypt.genSaltSync(10);
        var hashedPassword = bcrypt.hashSync(password, salt);
        // 2.0 insert the data into the CREDENTIALS table
        const { data, error } = await User.create(email, hashedPassword, type);
        console.log("user $$$ = ", data);
        if (error) {
            console.log("return statement error =", error);

            return { data, error };
        }

        // 3.0 obtain the credential_id based on the email. This is required to either update the WALKER or OWNERS table based on 'type'.
        //const tempUser = await User.getUserByEmail(email);

        // 4.0 generate a random number for the unique mobile number database constraint in the table
        const mobile = Math.ceil(Math.random() * 100000000);
        const { user } = data;
        // 5.0 USE tempuser's fields and TYPE pass to User.update to determine if WALKER or OWNER also gets updated on a new signup.
        const walker = await User.update(
            firstname,
            lastname,
            // to cater for unique mobile numbers
            mobile,
            user.email,
            user.credential_id,
            // pass "type" onwards to next function to determine if WALKER or OWNER table to be updated
            user.type
        );

        // PH: 14/07/21 GENERATE AUTH TOKEN WITH FIRST NAME, LASTNAME
        const token = User.generateAuthToken(
            user.credential_id,
            user.type,
            user.email,
            false,
            firstname,
            lastname
        );

        return { data: { user, token }, error };
    } catch (error) {
        console.log("Error from insertUser()", error);
        throw new Error(error);
    }
};



// PH 06/08/21 COMPARE PASSWORD FUNCTION
// IF we have a match return token otherwise return error msg;

const comparePassword = (requestPassword, dbUser) => {
    let token = null;
    let error = null;
    let user = null;

    // Compare passwords if match create token else create error message
    if (bcrypt.compareSync(requestPassword, dbUser.password)) {
        const {
            credential_id,
            type,
            email,
            is_profile_established,
            firstname,
            lastname,
        } = dbUser;
        console.log("dbuser = " + Object.keys(dbUser));
        token = User.generateAuthToken(
            credential_id,
            type,
            email,
            is_profile_established,
            firstname,
            lastname
        );

        user = {
            id: credential_id,
            email,
            type,
            hasProfile: is_profile_established,
            firstname,
            lastname,
        };
    } else {
        console.log("no match");
        // We don't have a match
        error = "Email Password Error!";
    }

    return { data: { token, user }, error };
};

module.exports = {
    getUsers,
    getUserByEmail,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
    // 27/07 - Glen playing around
    insertUser,

    comparePassword,
};
