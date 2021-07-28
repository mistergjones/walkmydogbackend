const express = require("express");
const router = express.Router();

const controller = require("../controllers/usersController");

// 27/07 - GLEN PLAYING AROUND TO INSERT A RECORD INTO USERS
router.post("/", async (req, res) => {
    const { firstname, lastname, email, hashedPassword } = req.body;

    try {
        const user = await controller.insertUser(
            firstname,
            lastname,
            email,
            hashedPassword
        );
        console.log("********* router.post: ", user);
        res.send(user);
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
