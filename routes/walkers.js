const express = require("express");
const auth = require("../middleware/auth");
const { walkerProfileValidator } = require("../middleware/validator");
const router = express.Router();

const controller = require("../controllers/walkersController");

// GJ: 14/09: this route is to obtain walker assigned walks by passing the credential id
router.get("/assignedwalks/:credential_id", async (req, res) => {
    try {
        const result = await controller.getWalkerAssignedWalks(
            req.params.credential_id
        );

        res.send(result.data.verificationData.rows);
    } catch (error) {
        console.log("There has been an error in obtaining an assigned walk");
        res.status(403).send(error);
    }
});

router.get("/:walker_id", async (req, res) => {
    // an object to capture the 2 datasets for walker
    const combinedDataset = {};
    try {
        // 1. extract teh actual Credential ID beging passed from teh frontend tokem form
        const actualWalkerCredentialID = req.params.walker_id;

        // attempt to obtain 2 data sets based on the walker credential id.
        const walkerCompletedWalks = await controller.getWalkerHistoricalCompletions(
            actualWalkerCredentialID
        );
        const walkerCompletedIncome = await controller.getWalkerHistoricalIncomeAggregation(
            actualWalkerCredentialID
        );

        // if we have at least one record, proceed with getting all data
        if (walkerCompletedWalks.data.historicalData.length > 0) {
            combinedDataset.walkerInfo =
                walkerCompletedWalks.data.walkerHistoricalData;
            combinedDataset.walkerIncomeInfo =
                walkerCompletedIncome.data.verificationData;
        }
        // ELSE : SEND blank dataset to frontend
        else {
            const nullDataset = {};
            nullDataset.walkerInfo = [];
            nullDataset.walkerIncomeInfo = [];
            res.send(nullDataset);
        }

        // IF a retried recrod is valid walker that has got at least 1 completed booking history..send all info back
        if (walkerCompletedWalks.data.historicalData.length > 0) {
            // 1. Capture the first intance of the actual walker_id from the above query and pass to the below query to then obtain income info FROM BOOKINGS TABLE.
            // NOTE: WallkerID is used in the Bookings Table for column "walker_assigned"
            const tempWalkerID =
                walkerCompletedWalks.data.historicalData[0].walker_id;

            const walkerCompletedIncome = await controller.getWalkerHistoricalIncomeAggregation(
                tempWalkerID
            );
            // 2. Place each dataset into the COMBINED dataset
            combinedDataset.walkerInfo =
                walkerCompletedWalks.data.historicalData;
            combinedDataset.walkerIncomeInfo =
                walkerCompletedIncome.data.verificationData.rows;
            // 3. Send complete dataset to frontend
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

router.get("/profile/:credentialId", async (req, res) => {
    try {
        const walkerProfile = await controller.getWalkerProfile(
            req.params.credentialId
        );
        res.send(walkerProfile);
    } catch (error) {
        console.log(error);
        res.status(403).send(error);
    }
});
module.exports = router;
