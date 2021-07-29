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
Booking.get = async (userType) => {
    try {
        const { rows } = await runSql(SQL.GET_OPEN_BOOKINGS_WALKER, []);
        return rows;
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

Booking.getBookingById = async (id, type) => {

    try {
        const { rows } = await runSql(SQL.GET_BOOKING_BY_ID, [id]);
        const dogInfo = {};
        dogInfo.dog_firstname = rows[0].dog_firstname;
        dogInfo.dog_breed = rows[0].dog_breed;
        dogInfo.dog_size = rows[0].dog_size;
        dogInfo.dog_always_leashed = rows[0].dog_always_leashed;

        console.log("rows[0] = ", { ...rows[0], dogInfo });
        return { ...rows[0], dogInfo };

    } catch (error) {
        console.log(error);
        return error;
    }
};

Booking.getBookingByIdAndType = async (id, type) => {

    try {
        const { rows } = await runSql(SQL.GET_BOOKING_DETAILS, [id, type]);
        return rows[0];

    } catch (error) {
        console.log(error);
        return error;
    }
};

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
