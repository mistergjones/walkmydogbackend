const express = require("express");
const router = express.Router();

const controller = require("../controllers/bookingsController");
const auth = require("../middleware/auth");
const { createBookingValidator } = require("../middleware/validator")

// router.post("/", async (req, res) => {
//     const { username, password } = req.body;
//     try {
//         const user = await userController.createUser(username, password);
//         res.send(user);

//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }

// })

router.get("/", async (req, res) => {
    try {
        console.log("bookings route before");
        const bookings = await controller.getBookings();
        console.log("bookings route after bookings = ", bookings);
        res.send(bookings)

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.get("/:id", async (req, res) => {
    try {
        const booking = await controller.getBookingById(req.params.id);
        res.send(booking)

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});
router.get("/:id/:type", auth, async (req, res) => {
    const { id, type } = req.params;
    console.log("we made it to route with id = " + id + "and type = " + type);
    try {
        const booking = await controller.getBookingByIdAndType(id, type);
        // console.log(booking);
        res.send(booking)

    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// router.put("/", async (req, res) => {
//     const { id, email } = req.body
//     try {
//         const user = await userController.updateUser(id, email);
//         res.send(user);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }

// })

// router.post("/:id", async (req, res) => {
//     try {
//         const id = await userController.deleteUser(req.params.id);
//         res.send(id);
//     } catch (error) {
//         console.log(error);
//         res.status(403).send(error);
//     }
// })

router.post("/", auth, createBookingValidator, async (req, res) => {
    console.log("reached post booking");
    const { booking } = req.body;
    console.log("booking =", booking);
    try {

        const result = await controller.createBooking(booking);
        console.log("booking post result = ", result);
        return res.send("create booking response.")
    } catch (error) {
        res.status(403).send("Error with create booking" + error)
    }
})

module.exports = router;