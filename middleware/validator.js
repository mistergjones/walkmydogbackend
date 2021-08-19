const Yup = require("yup");

// 06/08/21 PH: VALIDATE REQUEST FOR CORRECT VALIDATION FOR LOGIN
loginSchema = Yup.object({
    email: Yup.string().email("Email is invalid").required("Email is required"),
    password: Yup.string()
        .min(3, "You password must be at least 3 character or more")
        .required("Password is required"),
});

const loginValidator = async (req, res, next) => {
    // Check we have correct values from request.
    const { email, password } = req.body;
    try {
        await loginSchema.validate({ email, password });
        next();
    } catch (error) {
        console.log("Login validation failed", error.errors[0]);
        res.status(400).send(error.errors[0]);
    }
};

// GJ: VALIDATE REQUEST FOR CORRECT SIGN UP. JUST STICKING TO THE FIRST 4 FIELDS TO CHECK LOGIC
signUpSchema = Yup.object({
    firstname: Yup.string()
        .min(2, "Must be 2 chacters or greater")
        .max(15, "Must be 15 characters or less")
        .required("Firstname is Required"),
    lastname: Yup.string()
        .min(2, "Must be 2 chacters or greater")
        .max(20, "Must be 20 characters or less")
        .required("Lastname is Required"),
    email: Yup.string().email("Email is invalid").required("Email is required"),
    password: Yup.string()
        .min(3, "Password must be at least 3 characters or more")
        .required("Password is required"),
    // type: Yup.string().required("You must select an Owner or Walker option"),
});

const signupValidator = async (req, res, next) => {
    const { firstname, lastname, email, password } = req.body;
    console.log("validator.js -> sigmupValidator():", req.body);
    try {
        await signUpSchema.validate({ firstname, lastname, email, password });
        console.log("Signup Validator: we are here SO ALL GOOD");
        next();
    } catch (error) {
        console.log("Sign-upv alidation failed", error.errors[0]);
        res.status(400).send(error.errors[0]);
    }
};

insertDogInfoSchema = Yup.object({
    dogName: Yup.string()
        .min(2, "Dog name must be >= 2 letters")
        .required("Dog name Required"),
    dogBreed: Yup.string()
        .min(2, "Dog breed must be >= 2 letters")
        .required("Dog breedRequired"),
    dogSize: Yup.string().required("Please select your dog size"),
    requiresLeash: Yup.string().required(
        "Yes or No: Does your dog require an always on leash?"
    ),
});

const insertDogInfoSchemaValidator = async (req, res, next) => {
    // Check we have correct values from request.
    const { dogName, dogBreed, dogSize, requiresLeash } = req.body;
    console.log("validator.js -> insertDogInfoSchemeValidator():", req.body);
    try {
        await insertDogInfoSchema.validate({
            dogName,
            dogBreed,
            dogSize,
            requiresLeash,
        });
        // glen put a console log here so we know its passed
        next();
    } catch (error) {
        console.log("Insert Dog Info Failed in Owner Profile", error.errors[0]);
        res.status(400).send(error.errors[0]);
    }
};

module.exports = {
    loginValidator,
    signupValidator,
    insertDogInfoSchemaValidator,
};
