const { runSql } = require("../db/runsSql");
const SQL = require("../db/usersSql.js");

// USED FOR EXPORTING THE FUNCTIONS BELOW
const User = {};

// CREATE A USER
User.create = async (firstname, lastname, email, hashedPassword) => {
    try {
        await runSql(SQL.INSERT_USER, [
            firstname,
            lastname,
            email,
            hashedPassword,
        ]);
        const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);
        // return the first row as an array
        return rows[0];
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
        return { user: rows[0] };
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

// UPDATE A USER
User.update = async (id, email) => {
    try {
        await runSql(SQL.UPDATE_USER, [email, id]);
        const { rows } = await runSql(SQL.GET_USER_BY_ID, [id]);
        return { user: rows[0] };
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

module.exports = User;
