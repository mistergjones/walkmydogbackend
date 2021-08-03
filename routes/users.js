const express = require("express");
const auth = require("../middleware/auth")
const router = express.Router();

const controller = require("../controllers/usersController");

// 27/07 - GLEN PLAYING AROUND TO INSERT A RECORD INTO USERS
// router.post("/", async (req, res) => {
//     const { firstname, lastname, email, hashedPassword } = req.body;

//     try {
//         const user = await controller.insertUser(
//             firstname,
//             lastname,
//             email,
//             hashedPassword
//         );
//         console.log("********* router.post: ", user);
//         res.send(user);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// });

// 01/08: GJ: attempting to insert credentials
router.post("/", async (req, res) => {
    // NOTE: firsntame and lastname are just being passed through for later use
    const { email, password, type, firstname, lastname } = req.body;

    try {
        const user = await controller.insertUser(
            email,
            password,
            type,
            firstname,
            lastname
        );
        //console.log("********* router.post: ", user);
        res.send(user);

        // ***** Changes for jwt token in response
        // res
        //     .header("x-auth-token", token)
        //     .header("access-control-expose-headers", "x-auth-token")
        //     .send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// router.post("/", async (req, res) => {
//     const { username, password } = req.body;
//     try {
//         const user = await controller.createUser(username, password);
//         res.send(user);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// });

router.get("/", async (req, res) => {
    try {
        const users = await controller.getUsers();
        res.send(users);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.get("/:id", async (req, res) => {
    try {
        const user = await controller.getUserByEmail(req.params.id);
        res.send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// 27/07 - GLEN PLAYING AROUND
router.get("/:email", async (req, res) => {
    try {
        const user = await controller.getUserByEmail(req.params.email);
        res.send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});
////////////////////

router.put("/", async (req, res) => {
    const { id, email } = req.body;
    try {
        const user = await controller.updateUser(id, email);
        res.send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});
router.post("/profile", auth, async (req, res) => {

    const profile = req.body.profile;
    console.log("route post profile", profile);
    const result = await controller.updateProfile(profile);
    console.log("/profile result = " + result)

    res.header("x-auth-token", result)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
})

router.post("/:id", async (req, res) => {
    try {
        const id = await controller.deleteUser(req.params.id);
        res.send(id);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});


module.exports = router;
