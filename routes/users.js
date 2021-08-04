const express = require("express");
const auth = require("../middleware/auth");
const router = express.Router();

const controller = require("../controllers/usersController");

const bcrypt = require("bcryptjs");

// 01/08: GJ: Insert a USER INTO credentials. No need to pass "is_profile_established" as
// the database automatically adds this as FALSE to each record
router.post("/", async (req, res) => {
    // NOTE: firsntame and lastname are just being passed through for later use
    const { email, password, type, firstname, lastname } = req.body;

    try {
        const { user, token, error } = await controller.insertUser(
            email,
            password,
            type,
            firstname,
            lastname
        );

        console.log("inside create user: ", error);
        if (error) {
            console.log("inside error");
            return res.status(400).send(error);
        }
        // ***** Changes for jwt token in response
        res.header("x-auth-token", token)
            .header("access-control-expose-headers", "x-auth-token")
            .send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.get("/", async (req, res) => {
    try {
        const users = await controller.getUsers();
        res.send(users);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// GJ: this was commented out as this route will called first before :/email???
// router.get("/:id", async (req, res) => {
//     try {
//         const user = await controller.getUserByEmail(req.params.id);
//         res.send(user);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// });

// 27/07 - THE BELOW ROUTE RETURNS A USER FROM THE CREDENTIALS TABLE
router.get("/:email", async (req, res) => {
    try {
        const { user, token } = await controller.getUserByEmail(
            req.params.email
        );
        console.log(
            "inside ROUTES/users.js/router.get(:email) --> get email: ",
            user
        );
        // ***** Changes for jwt token in response
        res.header("x-auth-token", token)
            .header("access-control-expose-headers", "x-auth-token")
            .send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});
////////////////////

// 04/08: GJ: establishing a route for signin in and using bcrypt to check password
router.post("/login", async (req, res) => {
    const { email, password } = req.body;
    try {
        const { user, token } = await controller.getUserByEmail(email);

        // ***** Changes for jwt token in response
        if (bcrypt.compareSync(password, user["password"]) === true) {
            console.log("its true");
            // NEED TO REMOVE PASSWORD FORM THE RESPONSE
            res.header("x-auth-token", token)
                .header("access-control-expose-headers", "x-auth-token")
                .send(user);
        }
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

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
    console.log("/profile result = " + result);

    res.header("x-auth-token", result)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
});

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
