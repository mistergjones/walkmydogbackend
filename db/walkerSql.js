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
,
    // GJ: The below query gets all "bookings" for an individual walker that has completed.
    GET_WALKER_HISTORICAL_COMPLETIONS: `Select walkers.walker_id, walkers.firstname, walkers.lastname, bookings.date, bookings.start_time, services.service_type, bookings.booking_status, dogs.dog_firstname, bookings.service_fee FROM (((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) INNER JOIN services ON bookings.service_id = services.service_id) WHERE credential_id = $1 AND booking_status = 'C';`,
    // GJ: The below query aggregates the walker's incomce by each service type
    GET_WALKER_HISTORICAL_INCOME_AGGREGATION: `SELECT services.service_type, bookings.booking_status, SUM(bookings.service_fee) as booked_income FROM services,bookings WHERE bookings.service_id = services.service_id AND walker_assigned = $1 AND booking_status = 'C' GROUP BY service_type, booking_status;`,


    GET_WALKER_PREFERENCES_BY_CREDENTIAL_ID:
        "SELECT lat, lng, walker_30wo, walker_30hv, sizepreferences.size_preference FROM walkers, sizepreferences WHERE credential_id=$1 and walkers.size_id = sizepreferences.size_id;",


    // walker_30WO INTEGER,
    // walker_30HV INTEGER,
    // walker_60WO INTEGER,
    // walker_60HV INTEGER,
    // GET_USER_BY_EMAIL:
    //     "SELECT credential_id, email, password, type FROM credentials WHERE email = $1;",
    // GET_WALKER_BY_ID:
    //     "SELECT walker_id, firstname, lastname, email FROM WALKERS WHERE walker_id = $1;",
    // UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    // DELETE_USER: "DELETE FROM USERS WHERE user_id = $1",
    // INSERT_USER:
    //     "INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES ($1, $2,'','',0000,'',$3,$4,'1900-01-01','','','',000000,00000000,0,'N',0,0,0,0,'FALSE',8);",
    // INSERT_USER_INTO_CREDENTIALS:
    //     "INSERT INTO CREDENTIALS (email, password, type) VALUES ($1,$2,$3);",
    // INSERT_WALKER:
    //     "INSERT INTO walkers (firstname, lastname, street_address, suburb, postcode, mobile, email, dob, licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO, walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ($1, $2, '','',0000, $3, $4,'1900-01-01','','','',000000,00000000,0,'W',0,0,0,0,'FALSE',8,$5);",
    // INSERT_OWNER:
    //     "INSERT INTO owners (firstname, lastname, street_address, suburb, postcode, mobile, email, dob, licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ($1, $2, '','',0000, $3, $4,'1900-01-01','','','',000000,00000000,0,'O','FALSE',$5);",
};
