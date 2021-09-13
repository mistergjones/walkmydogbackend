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

const getWalkerPreferencesByCredentialId = async (credentialId) => {
    console.log("CREDENTIAL ID: ", credentialId);
    try {
        const walkerPreferences = await Walker.getWalkerPreferencesByCredentialId(credentialId);
        console.log("DO I HAVE A Walker???", walkerPreferences);
        return walkerPreferences;
    } catch (error) {
        console.log(
            "walkersontroller: Error from getWalkerByCredentialId()",
            error
        );
        return error;
    }
};

module.exports = {
    updateProfile,
    getWalkerPreferencesByCredentialId
}