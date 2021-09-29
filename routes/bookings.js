const express = require("express");
const router = express.Router();

const controller = require("../controllers/bookingsController");
const auth = require("../middleware/auth");
const { createBookingValidator } = require("../middleware/validator");

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

// GJ: 16/09: This route will CANCEL (i.e PATCH) to update a booking to cancelled.
// It will return TRUE if record updated succesfully. FALSE if it didn't
router.patch("/:booking_id", async (req, res) => {
    console.log("CANCEL BOOKING PATCHING IS PRESENT - now do the query");
    const data = req.body;
    try {
        console.log("The body si:", data);
        // console.log("The params si:", req.params);
        const bookings = await controller.cancelBooking(data);
        console.log("bookings.js -> router.patch -> bookings", bookings.data);
        // send back either TRUE or FALSE
        res.send(bookings);
    } catch (error) {
        console.log(
            "There was an error updating a cancellation by the walker",
            error
        );
        // res.status(403).send(error);
    }
});

router.get("/", async (req, res) => {
    try {
        console.log("bookings route before");
        const bookings = await controller.getBookings();
        console.log("bookings route after bookings = ", bookings);
        res.send(bookings);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// GJ: 22/09: This will obtain the ASSIGNED AND OPEN jobs that an OWNER can then view
router.get("/assigned/:credentialID", async (req, res) => {
    // console.log("ARE WE HERE????? routes booking.js. PARAMS", req.params);
    // console.log("ARE WE HERE????? routes booking.js BODY", req.body);
    const ownerCredentialId = req.params.credentialID;
    try {
        // obatain any assigned Jobs
        const assignedJobs = await controller.getAssignedJobsForOwner(
            ownerCredentialId
        );
        // obtain any open jobs
        const openJobs = await controller.getOpenJobsForOwner(
            ownerCredentialId
        );

        // console.log(
        //     "Router.js -> assigned jobs -> ARE WE HERE????? Length Records: ",
        //     assignedJobs.length,
        //     openJobs.length
        // );
        res.send({ assignedJobs, openJobs });
    } catch (error) {
        console.log(
            "ERROR: routes.js -> bookings.js -> ownerCredentialId",
            error
        );
    }
});

// GJ: 20/09: This will obtain the completed jobs that an OWNER can then view
router.get("/completed/:credentialID", async (req, res) => {
    // console.log("ARE WE HERE????? routes booking.js. PARAMS", req.params);
    // console.log("ARE WE HERE????? routes booking.js BODY", req.body);
    const ownerCredentialId = req.params.credentialID;
    try {
        const result = await controller.getCompletedJobsForOwner(
            ownerCredentialId
        );
        console.log(
            "Router.js -> completed jobs -> ARE WE HERE????? Length Records: ",
            result.length
        );
        res.send(result);
    } catch (error) {
        console.log(
            "ERROR: routes.js -> bookings.js -> ownerCredentialId",
            error
        );
    }
});

router.get("/:id", async (req, res) => {
    try {
        const booking = await controller.getBookingById(req.params.id);
        res.send(booking);
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
        res.send(booking);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

router.put("/", async (req, res) => {
    const { status, bookingId, walkerAssigned } = req.body;

    try {
        const response = await controller.updateBookingStatus(
            status,
            walkerAssigned,
            bookingId
        );
        res.send(response);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

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
        return res.send("create booking response.");
    } catch (error) {
        res.status(403).send("Error with create booking" + error);
    }
});

module.exports = router;
