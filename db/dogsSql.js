module.exports = {
    // CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    // GET_USERS: "SELECT user_id, email FROM USERS;",
    // GET_USER_BY_EMAIL: "SELECT user_id, email FROM USERS WHERE email = $1;",
    GET_DOG_BY_ID: "SELECT dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed FROM DOGS WHERE dog_id = $1;",
    // UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    // DELETE_USER: "DELETE FROM USERS WHERE user_id = $1"
}

