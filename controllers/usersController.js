// REQUIRE MODEL
const User = require("../models/user.js");
// Require BCRYPT for encrypting the password
const bcrypt = require("bcryptjs");

// GET ALL USERS
const getUsers = async () => {
    // just get the WALKERS only
    try {
        const users = await User.get();

        return users;
    } catch (error) {
        console.log("Error from getUser()", error);
        return error;
    }
};
// GET SINGLE USER BY EMAIL
const getUserByEmail = async (email) => {
    try {
        const user = await User.getUserByEmail(email);

        return user;
    } catch (error) {
        console.log("Error from getUserByEmail()", error);
        return error;
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

// 01/08: GJ: inserting user details into table credentials
const insertUser = async (email, password, type, firstname, lastname) => {
    // NEED VALIDATION LOGIC HERE
    try {
        // 1.0 need to hash the password before insertion
        var salt = bcrypt.genSaltSync(10);
        var hashedPassword = bcrypt.hashSync(password, salt);
        // 2.0 insert the data into the CREDENTIALS table
        const user = await User.create(email, hashedPassword, type);
        console.log("user $$$ = ", user)
        if (user.error) {
            console.log("return statement");

            return user;
        }

        // 3.0 obtain the credential_id based on the email. This is required to either update the WALKER or OWNERS table based on 'type'.
        const tempUser = await User.getUserByEmail(email);

        // 4.0 generate a random number for the unique mobile number database constraint in the table
        const mobile = Math.ceil(Math.random() * 100000000);

        // 5.0 USE tempuser's fields and TYPE pass to User.update to determine if WALKER or OWNER also gets updated on a new signup.
        const walker = await User.update(
            firstname,
            lastname,
            // to cater for unique mobile numbers
            mobile,
            tempUser.user.email,
            tempUser.user.credential_id,
            // pass "type" onwards to next function to determine if WALKER or OWNER table to be updated
            tempUser.user.type
        );

        return user;
    } catch (error) {
        console.log("Error from insertUser()", error);
        return error;
    }
};

const updateProfile = async (profile) => {
    console.log("controller update profile = ", profile);
    try {
        const result = await User.updateProfile(profile);
        console.log("controller update profile result = ", result);
        return result;
    } catch (error) {
        console.log("error from update profile = " + error);
    }
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
    updateProfile,
};
