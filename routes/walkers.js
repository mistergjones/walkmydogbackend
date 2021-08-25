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

module.exports = router;