const express = require("express");
const auth = require("../middleware/auth");
const { walkerProfileValidator } = require("../middleware/validator");
const router = express.Router();

const controller = require("../controllers/walkersController");

router.get("/:walker_id", async (req, res) => {
    // an object to capture the 2 datasets for walker
    const combinedDataset = {};
    // console.log(req.params);
    const walkerCompletedWalks = await controller.getWalkerHistoricalCompletions();
    const walkerCompletedIncome = await controller.getWalkerHistoricalIncomeAggregation();
    // place each dataset into the combined dataset
    console.log("GJ GJ GJ: ", walkerCompletedIncome.data.verificationData.rows);
    combinedDataset.walkerInfo =
        walkerCompletedWalks.data.walkerHistoricalData.rows;
    combinedDataset.walkerIncomeInfo =
        walkerCompletedIncome.data.verificationData.rows;

    res.send(combinedDataset);
});

router.post("/profile", auth, walkerProfileValidator, async (req, res) => {
    const { data, error } = await controller.updateProfile(req.body.profile);
    if (error) res.status(400).send(error);
    console.log("route profile data = ", data);
    res.header("x-auth-token", data.token)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
});

module.exports = router;
