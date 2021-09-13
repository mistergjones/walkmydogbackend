const express = require("express");
const auth = require("../middleware/auth");
const { walkerProfileValidator } = require("../middleware/validator");
const router = express.Router();

const controller = require("../controllers/walkersController");

router.get("/:walker_id", async (req, res) => {
    const combinedDataset = {};
    try {
        // pass the actual walker credential_id to the query to obtain completed walks
        const walkerCompletedWalks = await controller.getWalkerHistoricalCompletions(
            req.params.walker_id
        );

        // IF a retried recrod is valid walker that has got at least 1 completed booking history..send all info back
        if (walkerCompletedWalks.data.historicalData.length > 0) {
            // capture the first intance of the actual walker_id from the above query and pass to the below query to
            // obtain income info FROM BOOKINGS TABLE.
            // WallkerID is used in the Bookings Table for column "walker_assigned"
            const tempWalkerID =
                walkerCompletedWalks.data.historicalData[0].walker_id;

            const walkerCompletedIncome = await controller.getWalkerHistoricalIncomeAggregation(
                tempWalkerID
            );
            // place each dataset into the combined dataset
            // console.log("GJ GJ GJ: ", walkerCompletedIncome.data.verificationData.rows);
            combinedDataset.walkerInfo =
                walkerCompletedWalks.data.historicalData;
            combinedDataset.walkerIncomeInfo =
                walkerCompletedIncome.data.verificationData.rows;

            console.log("Combined Dataset is:", combinedDataset);
            res.send(combinedDataset);
        } else {
            // need to send a blank object back to the front end if walker has ZERO complmeted bookings
            const nullDataset = {};
            nullDataset.walkerInfo = {};
            nullDataset.walkerIncomeInfo = {};
            res.send(combinedDataset);
        }
    } catch (error) {
        console.log("XXXXXXXXX", error);
        res.status(403).send(error);
    }
});

router.post("/profile", auth, walkerProfileValidator, async (req, res) => {
    const { data, error } = await controller.updateProfile(req.body.profile);
    if (error) res.status(400).send(error);
    // console.log("route profile data = ", data);
    res.header("x-auth-token", data.token)
        .header("access-control-expose-headers", "x-auth-token")
        .send("ok");
});

module.exports = router;
