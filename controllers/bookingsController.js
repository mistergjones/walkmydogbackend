
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
// // GET SINGLE USER BY ID
// const getUserById = async (id) => {
//     try {
//         const user = await User.getUserById(id);
//         return user;
//     } catch (error) {
//         console.log("Error from getUserById()", error);
//         return error
//     }
// }

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
    // getUserById,
    // createUser,
    // updateUser,
    // deleteUser
};