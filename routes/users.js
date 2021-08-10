const express = require("express");
const auth = require("../middleware/auth");
const { loginValidator } = require("../middleware/validator")
const router = express.Router();

const controller = require("../controllers/usersController");



// 01/08: GJ: Insert a USER INTO credentials. No need to pass "is_profile_established" as
// the database automatically adds this as FALSE to each record
router.post("/", async (req, res) => {
    // NOTE: firsntame and lastname are just being passed through for later use
    const { email, password, type, firstname, lastname } = req.body;

    try {
        const { data, error } = await controller.insertUser(
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
        res.header("x-auth-token", data.token)
            .header("access-control-expose-headers", "x-auth-token")
            .send(data.user);
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
    console.log("email = ", req.params.email)
    try {
        const { user, token, error } = await controller.getUserByEmail(
            req.params.email
        );

        console.log("inside :/email route: ", error);
        if (error) {
            console.log("inside :/email route error");
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
////////////////////

// 04/08: GJ: establishing a route for signin in and using bcrypt to check password

// 06/08/21 PH: 
// 1: ADDED LOGIN VALIDATION MIDDLEWARE TO ENSURE WE HAVE EXPECTED DATA FROM REQUEST.
// 2: GET USER DETAILS IF ERROR RETURN EMAIL ERROR MESSAGE
// 3: COMPARE PASSWORD FROM REQUEST WITH PASSWORD FROM DATABASE IF ERROR RETURN CREDENTIALS ERROR MESSAGE
// 4: SEND RESPONSE WITH TOKEN RECEIVED FROM COMPARE PASSWORD AND PASSBACK USER OBJECT

router.post("/login", loginValidator, async (req, res) => {

    try {
        const { email, password } = req.body;

        // PH: 06/08/21 IF SUCCESS ERROR WILL BE NULL AND WE WILL HAVE DATA.
        const { data: emailData, error: emailErrorMsg } = await controller.getUserByEmail(email);
        if (emailErrorMsg) return res.status(400).send(emailErrorMsg);

        // COMPARE PASSWORD IF NO ERROR WILL RECEIVE TOKEN AND USER OBJECT WITHOUT PASSWORD.
        const { data: passwordData, error: passwordErrorMsg } = controller.comparePassword(password, emailData.user);
        if (passwordErrorMsg) return res.status(400).send(passwordErrorMsg);

        // WE HAVE TOKEN AND VALID USER DATA RETURN VALID RESPONSE.
        res.header("x-auth-token", passwordData.token)
            .header("access-control-expose-headers", "x-auth-token")
            .send(passwordData.user);

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

    const { data, error } = await controller.updateProfile(req.body.profile);
    if (error) res.status(400).send(error);
    console.log("route profile data = ", data)
    res.header("x-auth-token", data.token)
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
