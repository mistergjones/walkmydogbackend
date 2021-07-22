module.exports = {
    CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_BOOKINGS: "SELECT * FROM BOOKINGS;",
    GET_OPEN_BOOKINGS:
        "SELECT date, start_time, town, service_type, dog_firstname, services.service_fee FROM users,bookings,dogs, services WHERE users.user_id = bookings.user_id AND bookings.dog_id = dogs.dog_id AND booking_status ='O' AND bookings.service_id = services.service_id;",
    GET_USER_BY_EMAIL: "SELECT user_id, email FROM USERS WHERE email = $1;",
    GET_USER_BY_ID: "SELECT user_id, email FROM USERS WHERE user_id = $1;",
    UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    DELETE_USER: "DELETE FROM USERS WHERE user_id = $1",
};
