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
        return rows[0];

    } catch (error) {
        console.log(error);
        return error;
    }
};



Booking.getBookingByIdAndType = async (id, type) => {

    try {
        const { rows } = await runSql(SQL.GET_BOOKING_BY_ID, [id]);

        let jobInfo = {};

        if (rows.length === 1) {

            jobInfo.startTime = rows[0].start_time;
            jobInfo.suburb = rows[0].suburb;
            jobInfo.serviceType = rows[0].service_type;
            jobInfo.serviceFee = rows[0].service_fee;
        }
        else {
            jobInfo = null;
        }

        if (type === "W") {
            const { rows } = await runSql(SQL.GET_BOOKING_DETAILS_WALKER, [id]);

            let dogInfo = {};

            if (rows.length === 1) {
                dogInfo.dogFirstname = rows[0].dog_firstname;
                dogInfo.dogBreed = rows[0].dog_breed;
                dogInfo.dogSize = rows[0].dog_size;
                dogInfo.dogAlwaysLeashed = rows[0].dog_always_leashed;
            } else {
                dogInfo = null;
            }
            return { jobInfo, dogInfo };
        }
        else if (type === "O") {

            const { rows } = await runSql(SQL.GET_BOOKING_DETAILS_OWNER, [id]);
            let walkerInfo = {};
            if (rows.length === 1) {
                walkerInfo.firstname = rows[0].firstname;
                walkerInfo.suburb = rows[0].suburb;
                walkerInfo.rating = rows[0].overall_rating;
            } else {
                walkerInfo = null;
            }

            return { jobInfo, walkerInfo };
        }

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
