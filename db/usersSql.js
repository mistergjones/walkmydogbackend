
module.exports = {
    CREATE_USER: "INSERT INTO USERS (email, password) VALUES($1, $2);",
    GET_USERS: "SELECT user_id, email FROM USERS;",
    GET_USER_BY_EMAIL: "SELECT user_id, email FROM USERS WHERE email = $1;",
    GET_USER_BY_ID: "SELECT firstname, town, overall_rating FROM USERS WHERE user_id = $1;",
    UPDATE_USER: "UPDATE USERS SET email = $1 WHERE user_id = $2;",
    DELETE_USER: "DELETE FROM USERS WHERE user_id = $1"
}