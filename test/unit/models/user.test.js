const User = require("../../../models/user");
const jwt = require("jsonwebtoken");

describe("user.generateAuthToken", () => {
    let payload = {
        id: 1,
        type: "W",
        email: "a@aaa.com",
        hasProfile: true,
        firstname: "firstname",
        lastname: "lastname"
    };
    it("should return a valid JWT", () => {

        const { id, type, email, hasProfile, firstname, lastname } = payload;
        const token = User.generateAuthToken(id, type, email, hasProfile, firstname, lastname);
        const decoded = jwt.verify(token, "1111");
        expect(decoded).toMatchObject(payload);
    })
    it("should throw  error message if firstname not supplied", () => {
        payload.firstname = "";
        expect(() => User.generateAuthToken(id, type, email, hasProfile, firstname, lastname)).toThrow();
    })
})

