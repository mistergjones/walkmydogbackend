const User = require("../../../models/user");
const jwt = require("jsonwebtoken");

describe("user.generateAuthToken", () => {
    it("should return a valid JWT", () => {
        const payload = {
            id: 1,
            type: "W",
            email: "a@aaa.com",
            hasProfile: true,
            firstname: "firstname",
            lastname: "lastname"
        };
        const { id, type, email, hasProfile, firstname, lastname } = payload;
        const token = User.generateAuthToken(id, type, email, hasProfile, firstname, lastname);
        const decoded = jwt.verify(token, "1111");
        expect(decoded).toMatchObject(payload);
    })
})