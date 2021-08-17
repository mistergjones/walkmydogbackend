const express = require("express");
const auth = require("../middleware/auth");
const router = express.Router();

const { loginValidator } = require("../middleware/validator");

const controller = require("../controllers/ownersController");

// THIS WILL RETRIVE ALL OWNERS
router.get("/", async (req, res) => {
    try {
        const owners = await controller.getOwners();
        res.send(owners);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// THIS WILL RETREIVE 1 SPECIFIC OWNER BASED ON THEIR CREDENTIAL ID
router.get("/:credentialId", async (req, res) => {
    console.log("CREDNEITAL ID: ", req.params);
    try {
        const owner = await controller.getOwnerByCredentialId(
            req.params.credentialId
        );
        res.send(owner);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

// THIS WILL POST OWNER INFORMATION INTO THE OWNERS TABLE
router.post("/", async (req, res) => {
    // destructure and extract all column names from req.body
    const {
        firstname,
        lastname,
        streetAddress,
        suburb,
        postcode,
        mobile,
        dob,
        driverLicence,
        bankName,
        BSB,
        accountNumber,
    } = req.body;

    try {
        const newOwner = await controller.updateOwner(
            firstname,
            lastname,
            streetAddress,
            suburb,
            postcode,
            mobile,
            dob,
            driverLicence,
            bankName,
            BSB,
            accountNumber
        );
        res.sendStatus(200).send(newOwner);
        console.log("routes/owners.js ==> router.post", newOwner);
    } catch (error) {
        res.status(403).send(error);
    }
});

module.exports = router;
