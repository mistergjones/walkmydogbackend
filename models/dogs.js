const { runSql } = require("../db/runsSql");
const SQL = require("../db/dogsSql");


// USED FOR EXPORTING THE FUNCTIONS BELOW
const Dog = {};

// CREATE A USER
// User.create = async (username, password) => {
//     try {
//         await runSql(SQL.CREATE_USER, [username, password]);
//         const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [username]);
//         return { user: rows[0] };

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// GET ALL USERS
// User.get = async () => {
//     try {
//         const { rows } = await runSql(SQL.GET_USERS, []);
//         return rows;

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// GET SINGLE DOG


Dog.getDogById = async (id) => {

    try {
        const { rows } = await runSql(SQL.GET_DOG_BY_ID, [id]);
        return rows[0];

    } catch (error) {
        console.log(error);
        return error;
    }
};

// UPDATE A USER
// User.update = async (id, email) => {
//     try {
//         await runSql(SQL.UPDATE_USER, [email, id]);
//         const { rows } = await runSql(SQL.GET_USER_BY_ID, [id]);
//         return rows[0];

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// DELETE A USER
// User.delete = async (id) => {
//     try {
//         await runSql(SQL.DELETE_USER, [id]);
//         return { userId: id };
//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// // VALIDATE USER

// User.validate = (user) => {
//     // MAYBE USE YUP FOR VALIDATION SCHEMA
//     return true;
// }

module.exports = Dog;