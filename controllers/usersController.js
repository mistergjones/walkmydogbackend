// REQUIRE MODEL
const User = require("../models/user.js");

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
const getUserByEmail = async (email) => {
    try {
        // console.log("getUserByEmail is working");
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

// 27/07 - GLEN PLAYING AROUND - INSERT USER
const insertUser = async (firstname, lastname, email, hashedPassword) => {
    // NEED VALIDATION LOGIC HERE
    try {
        const user = await User.create(
            firstname,
            lastname,
            email,
            hashedPassword
        );
        return user;
    } catch (error) {
        console.log("Error from insertUser()", error);
        return error;
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
};
