module.exports = {
    CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_BOOKINGS: "SELECT * FROM BOOKINGS;",
    GET_OPEN_BOOKINGS_WALKER: "SELECT booking_id, date, start_time, suburb, service_type, services.service_fee, booking_status FROM owners,bookings, services WHERE owners.owner_id = bookings.owner_id AND bookings.service_id = services.service_id AND booking_status = 'O';",
    GET_USER_BY_EMAIL: "SELECT user_id, email FROM USERS WHERE email = $1;",
    GET_BOOKING_BY_ID: "select bookings.date, start_time, owners.suburb, services.service_type, services.service_fee, dog_firstname, dog_breed, dog_size, dog_always_leashed  from bookings, services, owners, dogs  where booking_id = $1 and bookings.service_id = services.service_id AND bookings.owner_id = owners.owner_id AND bookings.owner_id = dogs.owner_id;",
    UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    DELETE_USER: "DELETE FROM USERS WHERE user_id = $1",
    GET_BOOKING_DETAILS: "select date, duration, booking_status, dog_firstname as dogname, dog_breed, dog_always_leashed, dog_size, firstname as user, town, overall_rating, start_time, town, service_type, services.service_fee  from bookings, dogs, users, services  where booking_id = $1 AND users.type = $2 AND bookings.dog_id = dogs.dog_id AND bookings.user_id = users.user_id AND bookings.service_id = services.service_id;"
};
