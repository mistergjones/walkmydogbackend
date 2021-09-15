module.exports = {
    // CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_OWNERS: "SELECT firstname, lastname, email FROM owners;",
    GET_OWNER_BY_CREDENTIAL_ID:
        "SELECT firstname, lastname, email, owner_id from OWNERS WHERE credential_id=$1;",
    GET_OWNER_PROFILE_BY_CREDENTIAL_ID:
        "SELECT firstname, lastname, email,street_address, suburb, state, postcode, mobile,dob, licence_num, bank_name, bank_BSB,bank_acct_num, dog_breed, dog_firstname , dog_photo, dog_size, dog_always_leashed, owners.owner_id  from OWNERS, dogs WHERE credential_id=$1 AND owners.owner_id = dogs.owner_id;",
    UPDATE_OWNER:
        "UPDATE owners SET firstname = $1, lastname = $2, street_address=$3 ,suburb=$4,state=$5, postcode=$6,mobile=$7,dob=$8,licence_num=$9,bank_name=$10,bank_BSB=$11,bank_acct_num=$12, overall_rating=5, active_membership=TRUE, lat = $13, lng = $14 WHERE credential_id=$15;",
    UPDATE_USER_PROFILE:
        "UPDATE credentials SET is_profile_established = TRUE WHERE credential_id = $1",
    GET_USER_BY_CREDENTIAL_ID:
        "SELECT credential_id, email, password, is_profile_established, type FROM credentials WHERE credential_id = $1;",
};
