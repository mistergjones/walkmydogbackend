const Walker = require("../models/walker.js");

//GJ: 07/09: GJ: The below query aggregates the walker's incomce by each service type
const getWalkerHistoricalIncomeAggregation = async () => {
    try {
        const {
            data,
            error,
        } = await Walker.getWalkerHistoricalIncomeAggregation();

        // console.log(
        //     "walkerController.js => getWalkerHistoricalIncomeAggregation = ",
        //     data
        // );
        return { data, error: null };
    } catch (error) {
        console.log(
            "walkerController.js => error from getWalkerHistoricalCompletions = " +
                error
        );
        return { data: null, error };
    }
};

//GJ: 07/09: The below simply obtains all completed walkers by the individual walker
const getWalkerHistoricalCompletions = async () => {
    try {
        const { data, error } = await Walker.getWalkerHistoricalCompletions();

        console.log(
            "walkerController.js => getWalkerHistoricalCompletins = ",
            data
        );
        return { data, error: null };
    } catch (error) {
        console.log(
            "walkerController.js => error from getWalkerHistoricalCompletins = " +
                error
        );
        return { data: null, error };
    }
};

const updateProfile = async (profile) => {
    try {
        const { data, error } = await Walker.updateProfile(profile);
        if (error) return { data: null, error: error };
        return { data, error: null };
    } catch (error) {
        console.log("error from update profile = " + error);
        return { data: null, error };
    }
};

module.exports = {
    updateProfile,
    getWalkerHistoricalCompletions,
    getWalkerHistoricalIncomeAggregation,
};
