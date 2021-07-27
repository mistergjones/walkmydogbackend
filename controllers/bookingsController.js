
// REQUIRE MODEL
const Booking = require("../models/booking.js");

// GET ALL BOOKINGS
const getBookings = async () => {
    try {
        const bookings = await Booking.get();
        return bookings;
    } catch (error) {
        console.log("Error from getBookings()", error);
        return error
    }
}
// GET SINGLE USER BY EMAIL
// const getUserByEmail = async (email) => {
//     try {
//         const user = await User.getUserByEmail(email);
//         return user;
//     } catch (error) {
//         console.log("Error from getUserByEmail()", error);
//         return error
//     }
// }
// GET SINGLE BOOKING BY ID
const getBookingById = async (id) => {
    try {
        const booking = await Booking.getBookingById(id);
        return booking;
    } catch (error) {
        console.log("Error from getBookingId()", error);
        return error
    }
}

// // CREATE USER
// const createUser = async (username, password) => {
//     // NEED VALIDATION LOGIC HERE
//     if (!User.validate(username)) return "Validation error";

//     try {
//         const user = await User.create(username, password);
//         return user;
//     } catch (error) {
//         console.log("Error from createUser()", error);
//         return error
//     }
// }

// // UPDATE USER
// const updateUser = async (id, email) => {
//     // NEED VALIDATION LOGIC HERE
//     if (!User.validate(email)) return "Validation error";

//     try {
//         const user = await User.update(id, email);
//         return user;
//     } catch (error) {
//         console.log("Error from updateUser()", error);
//         return error
//     }

// }

// // DELETE USER
// const deleteUser = async (id) => {

//     try {
//         const userId = await User.delete(id);
//         return userId
//     } catch (error) {
//         console.log("Error from deleteUser()", error);
//         return error
//     }

// }


module.exports = {
    getBookings,
    // getUserByEmail,
    getBookingById,
    // createUser,
    // updateUser,
    // deleteUser
};