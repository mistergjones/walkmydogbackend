const express = require("express");
const auth = require("../middleware/auth");
const { walkerProfileValidator } = require("../middleware/validator");
const router = express.Router();

const controller = require("../controllers/walkersController");

router.post("/profile", auth, walkerProfileValidator, async (req, res) => {
    const { data, error } = await controller.updateProfile(req.body.profile);
    if (error) res.status(400).send(error);
    console.log("route profile data = ", data);
    res.header("x-auth-token", data.token)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
});

router.get("/preferences/:credentialId", async (req, res) => {
    console.log("CREDNEITAL ID: ", req.params);
    try {
        const walkerPreferences = await controller.getWalkerPreferencesByCredentialId(
            req.params.credentialId
        );
        res.send(walkerPreferences);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});

module.exports = router;