const Walker = require("../models/walker.js");

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
    updateProfile
}