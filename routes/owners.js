const express = require("express");
const auth = require("../middleware/auth");
const router = express.Router();

const { ownerProfileValidator } = require("../middleware/validator");

const controller = require("../controllers/ownersController");

router.get("/profile/:ownerId", async (req, res) => {
    console.log("get owner profile = ", req.params)
    try {
        const ownerProfile = await controller.getOwnerProfile(req.params.ownerId);
        res.send(ownerProfile);
    } catch (error) {
        console.log("error route get owner profile " + error);
        res.status(403).send("error get owner profile" + error);
    }
})
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

// OWNER TABLE: THIS WILL RETREIVE 1 SPECIFIC OWNER BASED ON THEIR CREDENTIAL ID
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

router.post("/profile", auth, ownerProfileValidator, async (req, res) => {
    // now need to update the owner and dog info
    console.log("profile routes = *********************", req.body.profile)
    const { data, error } = await controller.updateProfile(req.body.profile);
    if (error) res.status(400).send(error);
    console.log("route profile data = ", data);
    res.header("x-auth-token", data.token)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
});

// THIS WILL UPDATE THE OWNER INFORMATION INTO THE OWNERS TABLE WHEN A USER HAS SIGNED UP AS A OWNER
// router.post("/", async (req, res) => {
//     try {
//         // 1.0 Package the req.body into an object for easy paramter passing.
//         const ownerInfoDataObj = req.body;

//         // 2.0 IF successful insert, return an object with the data and error
//         const newOwner = await controller.updateOwner(ownerInfoDataObj);
//         res.sendStatus(200).send(newOwner);
//         console.log("routes/owners.js ==> router.post", newOwner);
//     } catch (error) {
//         res.status(403).send(error);
//     }
// });

module.exports = router;
