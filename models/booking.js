const { runSql } = require("../db/runsSql");
const SQL = require("../db/bookingsSql");

// USED FOR EXPORTING THE FUNCTIONS BELOW
const Booking = {};

// CREATE A BOOKING
// Booking.create = async (username, password) => {
//     try {
//         await runSql(SQL.CREATE_USER, [username, password]);
//         const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [username]);
//         return { user: rows[0] };

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// GET ALL BOOKINGS
Booking.get = async () => {
    try {
        const { rows } = await runSql(SQL.GET_OPEN_BOOKINGS, []);
        return { bookings: rows };
    } catch (error) {
        console.log(error);
        return error;
    }
};

// GET SINGLE USER
// Booking.getUserByEmail = async (email) => {

//     try {
//         const { rows } = await runSql(SQL.GET_USER_BY_EMAIL, [email]);
//         return { user: rows[0] };

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// Booking.getUserById = async (id) => {

//     try {
//         const { rows } = await runSql(SQL.GET_USER_BY_ID, [id]);
//         return { user: rows };

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// // UPDATE A USER
// Booking.update = async (id, email) => {
//     try {
//         await runSql(SQL.UPDATE_USER, [email, id]);
//         const { rows } = await runSql(SQL.GET_USER_BY_ID, [id]);
//         return { user: rows[0] };

//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// // DELETE A USER
// Booking.delete = async (id) => {
//     try {
//         await runSql(SQL.DELETE_USER, [id]);
//         return { userId: id };
//     } catch (error) {
//         console.log(error);
//         return error;
//     }
// };

// // VALIDATE USER

// Booking.validate = (user) => {
//     // MAYBE USE YUP FOR VALIDATION SCHEMA
//     return true;
// }

module.exports = Booking;
