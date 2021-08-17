module.exports = {
    // CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_OWNERS: "SELECT firstname, lastname, email FROM owners;",
    GET_OWNER_BY_CREDENTIAL_ID:
        "SELECT firstname, lastname, email, owner_id from OWNERS WHERE credential_id=$1;",
    UPDATE_OWNER:
        "UPDATE OWNERS SET firstname = $1, lastname = $2, street_address=$3 ,suburb=$4,postcode=$5,mobile=$6,dob=$7,licence_num=$8,bank_name=$9,bank_BSB=$10,bank_acct_num=$11, overall_rating=5, active_membership=TRUE WHERE credential_id=126;",
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
