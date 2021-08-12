const express = require("express");
const router = express.Router();

const controller = require("../controllers/dogsController");

router.post("/", async (req, res) => {
    console.log("GJ", req.body);

    // 1.0 unpack the req.body into its variables
    const dogName = req.body.dogName;
    const dogBreed = req.body.dogBreed;
    const dogSize = req.body.dogSize;
    const requiresLeash = req.body.requiresLeash;
    try {
        const dog = await controller.insertDog(
            dogName,
            dogBreed,
            dogSize,
            requiresLeash
        );
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
