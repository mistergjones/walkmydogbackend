module.exports = {
    // CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_WALKER:
        "SELECT firstname, lastname FROM walkers WHERE credential_id = $1;",
    UPDATE_WALKER: `UPDATE walkers SET firstname = $1,
            lastname = $2,
            street_address=$3,
            suburb=$4,
            state=$5,
            postcode=$6,
            mobile=$7,
            dob=$8,
            licence_num=$9,
            bank_name=$10,
            bank_BSB=$11,
            bank_acct_num=$12,
            overall_rating=5,
            active_membership=TRUE,
            size_id = sizepreferences.size_id,
            walker_30HV = $13,
            walker_60HV = $14,
            walker_30WO = $15,
            walker_60WO = $16,
            lat = $17,
            lng = $18 
            FROM sizepreferences
            where sizepreferences.size_preference = $19
            AND credential_id=$20;`,
    // GJ: The below query gets all "bookings" for an individual walker that has completed.
    GET_WALKER_HISTORICAL_COMPLETIONS: `Select walkers.walker_id, walkers.firstname, walkers.lastname, bookings.booking_id, bookings.date, bookings.start_time, services.service_type, bookings.booking_status, dogs.dog_firstname, bookings.service_fee FROM (((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) INNER JOIN services ON bookings.service_id = services.service_id) WHERE credential_id = $1 AND booking_status = 'C';`,
    // GJ: The below query aggregates the walker's incomce by each service type
    GET_WALKER_HISTORICAL_INCOME_AGGREGATION: `SELECT services.service_type, bookings.booking_status, SUM(bookings.service_fee) as booked_income FROM services,bookings WHERE bookings.service_id = services.service_id AND walker_assigned = $1 AND booking_status = 'C' GROUP BY service_type, booking_status;`,

    GET_WALKER_PREFERENCES_BY_CREDENTIAL_ID:
        "SELECT lat, lng, walker_30wo, walker_30hv, sizepreferences.size_preference FROM walkers, sizepreferences WHERE credential_id=$1 and walkers.size_id = sizepreferences.size_id;",
    // GJ: The below query gets all "bookings" for an individual walker that has completed.
    // GET_WALKER_HISTORICAL_COMPLETIONS: `Select walkers.walker_id, walkers.firstname, walkers.lastname, bookings.date, bookings.start_time, services.service_type, bookings.booking_status, dogs.dog_firstname, bookings.service_fee FROM (((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) INNER JOIN services ON bookings.service_id = services.service_id) WHERE credential_id = $1 AND booking_status = 'C';`,
    // // GJ: The below query aggregates the walker's incomce by each service type
    // GET_WALKER_HISTORICAL_INCOME_AGGREGATION: `SELECT services.service_type, bookings.booking_status, SUM(bookings.service_fee) as booked_income FROM services,bookings WHERE bookings.service_id = services.service_id AND walker_assigned = $1 AND booking_status = 'C' GROUP BY service_type, booking_status;`,
    GET_WALKER_POFILE_BY_CREDENTIAL_ID:
        "SELECT firstname, lastname, street_address, suburb, dob, state, postcode, mobile, licence_num, licence_photo, bank_name, bank_BSB, bank_acct_num, lat, lng, walker_30wo, walker_60wo, walker_60hv, walker_30hv, sizepreferences.size_preference FROM walkers, sizepreferences WHERE credential_id=$1 and walkers.size_id = sizepreferences.size_id;",

    // GJ: The below query obtains the assigned jobs to a walker
    GET_WALKER_ASSIGNED_WALKS: `SELECT walkers.walker_id, walkers.firstname, walkers.lastname, bookings.booking_id, bookings.date, bookings.start_time, services.service_type, bookings.booking_status, dogs.dog_firstname, bookings.service_fee, owners.suburb FROM ((((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) INNER JOIN services ON bookings.service_id = services.service_id) INNER JOIN owners ON bookings.owner_id = owners.owner_id) WHERE walkers.credential_id = $1 AND booking_status = 'A';`,
};
