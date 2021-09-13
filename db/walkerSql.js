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
    GET_WALKER_PREFERENCES_BY_CREDENTIAL_ID:
        "SELECT lat, lng, walker_30wo, walker_30hv, sizepreferences.size_preference FROM walkers, sizepreferences WHERE credential_id=$1 and walkers.size_id = sizepreferences.size_id;",

    //         walker_30WO INTEGER,
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
