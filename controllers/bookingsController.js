
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
const getBookingByIdAndType = async (id, type) => {
    try {
        const booking = await Booking.getBookingByIdAndType(id, type);
        return booking;
    } catch (error) {
        console.log("Error from getBookingId()", error);
        return error
    }
}

const getBookingData = (booking) => {
    const { bookingDate, bookingTime, serviceType, mobile, specialInstructions, id } = booking;
    let bookingData = {};

    // Extract data from booking date and time and create a date object
    const day = bookingDate.split("-")[2];
    const month = bookingDate.split("-")[1];
    const year = bookingDate.split("-")[0];
    const hour = bookingTime.split(":")[0];
    const minute = bookingTime.split(":")[1];
    const second = 30;
    const convertedDate = new Date(year, month - 1, day, hour, minute, second);

    // Calculate duration of service in milliseconds
    const millisecondsInSecond = 1000;
    const secondsInMinute = 60;
    // if service type stars with 3 length is 30 mins otherwise its 60 mins
    const serviceLengthInMinutes = serviceType.split("")[0] === 3 ? 30 : 60;
    const serviceDurationInMilliseconds = serviceLengthInMinutes * secondsInMinute * millisecondsInSecond;

    // assigng values to booking data to be used for insert query
    const OPEN = "O";
    bookingData.date = bookingDate;
    bookingData.startTime = convertedDate.getTime() + convertedDate.getTimezoneOffset();
    bookingData.endTime = bookingData.startTime + serviceDurationInMilliseconds;
    bookingData.duration = serviceDurationInMilliseconds;
    bookingData.serviceType = serviceType;
    bookingData.ourComission = 5;
    bookingData.bookingStatus = OPEN;
    bookingData.bookingInstructions = specialInstructions;
    bookingData.ownerId = id;

    return bookingData;
}

// INSERT INTO BOOKINGS(date, start_time, end_time, duration, service_fee, our_comission, booking_status, booking_instructions, service_id, owner_id)
// CREATE BOOKING
const createBooking = async (booking) => {

    const bookingData = getBookingData(booking);

    try {
        const result = await Booking.create(bookingData);
        // console.log("result create booking controller = " + Object.keys(result));
        return "Booking Created successfully";
    } catch (error) {
        console.log("Error from createBooking() = ", error);
        return error
    }
}

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
    getBookingByIdAndType,
    createBooking,
    // updateUser,
    // deleteUser
};