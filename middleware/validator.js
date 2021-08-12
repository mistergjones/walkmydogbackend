const Yup = require("yup");

// 06/08/21 PH: VALIDATE REQUEST FOR CORRECT VALIDATION FOR LOGIN
loginSchema = Yup.object({
    email: Yup.string()
        .email("Email is invalid")
        .required("Email is required"),
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
        console.log("Login validation failed", error.errors[0])
        res.status(400).send(error.errors[0]);
    }
}

module.exports = {
    loginValidator,
}