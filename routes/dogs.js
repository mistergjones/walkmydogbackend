const express = require("express");
const router = express.Router();

const { insertDogInfoSchemaValidator } = require("../middleware/validator");

const controller = require("../controllers/dogsController");

router.post("/", insertDogInfoSchemaValidator, async (req, res) => {
    // 1.0 extract dog info from req.body to new data object
    const dogInfoObj = req.body;
    console.log("route.js -> dog post: ", req.body);

    try {
        const dog = await controller.insertDog(dogInfoObj);
        res.send(dog);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// router.get("/", async (req, res) => {
//     try {
//         const users = await controller.getUsers();
//         res.send(users)

//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// });

router.get("/:id", async (req, res) => {
    try {
        const dog = await controller.getDogById(req.params.id);
        res.send(dog);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// router.put("/", async (req, res) => {
//     const { id, email } = req.body
//     try {
//         const user = await controller.updateUser(id, email);
//         res.send(user);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }

// })

// router.post("/:id", async (req, res) => {
//     try {
//         const id = await controller.deleteUser(req.params.id);
//         res.send(id);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// })

module.exports = router;
