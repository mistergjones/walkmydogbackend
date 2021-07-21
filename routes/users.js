const express = require("express");
const router = express.Router();

const userController = require("../controllers/userController");

router.post("/", async (req, res) => {
    const { username, password } = req.body;
    try {
        const user = await userController.createUser(username, password);
        res.send(user);

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }

})

router.get("/", async (req, res) => {
    try {
        const users = await userController.getUsers();
        res.send(users)

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.get("/:id", async (req, res) => {
    try {
        const user = await userController.getUserById(req.params.id);
        res.send(user)

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.put("/", async (req, res) => {
    const { id, email } = req.body
    try {
        const user = await userController.updateUser(id, email);
        res.send(user);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }

})

router.post("/:id", async (req, res) => {
    try {
        const id = await userController.deleteUser(req.params.id);
        res.send(id);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
})

module.exports = router;