// REQUIRE MODEL
const Dog = require("../models/dogs");

// INSERT DOG
// Pass the dog object into it. Saves in passing many parameters
const insertDog = async (dogInfoObj) => {
    try {
        const successfulDogInsert = await Dog.insert(dogInfoObj);
        // console.log(
        //     "dogsController -> insert() --> DOG INFO",
        //     successfulDogInsert.data
        // );
        return { data: successfulDogInsert, error: null };
    } catch (error) {
        // console.log(
        //     "ERROR inserting DOG --> dogsController -> insert() -->",
        //     error
        // );
        return { data: null, error: error };
    }
};

// // GET ALL USERS
// const getUsers = async () => {
//     try {
//         const users = await User.get();
//         return users;
//     } catch (error) {
//         console.log("Error from getUser()", error);
//         return error
//     }
// }
// // GET SINGLE USER BY EMAIL
// const getUserByEmail = async (email) => {
//     try {
//         const user = await User.getUserByEmail(email);
//         return user;
//     } catch (error) {
//         console.log("Error from getUserByEmail()", error);
//         return error
//     }
// }
// GET SINGLE USER BY ID
const getDogById = async (id) => {
    try {
        const dog = await Dog.getDogById(id);
        return dog;
    } catch (error) {
        console.log("Error from getUserById()", error);
        return error;
    }
};

// CREATE USER
// const createUser = async (username, password) => {
//     // NEED VALIDATION LOGIC HERE
//     if (!User.validate(username)) return "Validation error";

//     try {
//         const user = await User.create(username, password);
//         return user;
//     } catch (error) {
//         console.log("Error from createUser()", error);
//         return error
//     }
// }

// UPDATE USER
// const updateUser = async (id, email) => {
//     // NEED VALIDATION LOGIC HERE
//     if (!User.validate(email)) return "Validation error";

//     try {
//         const user = await User.update(id, email);
//         return user;
//     } catch (error) {
//         console.log("Error from updateUser()", error);
//         return error
//     }

// }

// DELETE USER
// const deleteUser = async (id) => {

//     try {
//         const userId = await User.delete(id);
//         return userId
//     } catch (error) {
//         console.log("Error from deleteUser()", error);
//         return error
//     }

// }

module.exports = {
    // getUsers,
    // getUserByEmail,
    getDogById,
    insertDog,
    // createUser,
    // updateUser,
    // deleteUser
};
