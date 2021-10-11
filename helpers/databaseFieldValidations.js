// GJ - the purpose of these validation functions is to check the submitted data before being inserted into the database. This is to compliment the front end checking that also occurs

function checkValidEmailAddress(email) {
    console.log("DO WE GET HERE 1");
    // confirming valid email address on the backend just in case front end fails...
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) === false) {
        console.log("DO WE GET HERE 2");

        return {
            user: null,
            token: null,
            error: "Please ensure valid email address",
        };
    }
}

// This function checks to see if the input fields only contains a-z, A-z. Returns FALSE if there is an invalid field
function checkValidInputFields(firstname, lastname) {
    if (
        /^[a-zA-Z]+$/.test(firstname) === false ||
        /^[a-zA-Z]+$/.test(lastname) === false
    ) {
        return false;
    } else {
        return true;
    }
}

module.exports = {
    checkValidEmailAddress,
    checkValidInputFields,
};
