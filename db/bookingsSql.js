module.exports = {
    CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_BOOKINGS: "SELECT * FROM BOOKINGS;",
    GET_OPEN_BOOKINGS_WALKER: "SELECT booking_id, date, start_time, suburb, service_type, services.service_fee, booking_status FROM owners,bookings, services WHERE owners.owner_id = bookings.owner_id AND bookings.service_id = services.service_id AND booking_status = 'A';",
    GET_USER_BY_EMAIL: "SELECT user_id, email FROM USERS WHERE email = $1;",
    GET_BOOKING_BY_ID: "select bookings.date, start_time, owners.suburb, services.service_type, services.service_fee from bookings, services,owners where booking_id = $1 and bookings.service_id = services.service_id AND bookings.owner_id = owners.owner_id;",
    UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    DELETE_USER: "DELETE FROM USERS WHERE user_id = $1",
    GET_BOOKING_DETAILS_WALKER: "select dog_firstname, dog_breed, dog_size, dog_always_leashed  from bookings, dogs  where booking_id = $1 AND bookings.owner_id = dogs.owner_id;",
    GET_BOOKING_DETAILS_OWNER: "select walkers.firstname, walkers.suburb, walkers.overall_rating from bookings, walkers where bookings.walker_assigned = walkers.walker_id and booking_status = 'A' and booking_id = $1 ;",
};
