const request = require("supertest");
const User = require("../../../models/user");

let server;
describe("/api/walkers", () => {
    beforeEach(() => {
        server = require("../../../index");
    });
    afterEach(() => {
        server.close();
    });
    describe("/api/walkers/profile POST", () => {
        let profile;
        let token;

        beforeEach(() => {
            profile = {
                id: 253,
                type: "W",
                email: "valid@mail.com",
                firstname: "Johny",
                lastname: "Smith",
                streetAddress: "100 smith st",
                suburb: "Essendon",
                postCode: "3030",
                phone: `${Math.floor(Math.random() * 10000000000)}`,
                dob: "1990-03-16",
                licenseNumber: "111190",
                bankName: "CBA",
                bsb: "803126",
                accountNumber: "121212",
                size: ["S"],
                serviceType: ["Walks"],
            };

            token = User.generateAuthToken(
                profile.id,
                profile.type,
                profile.email,
                false,
                profile.firstname,
                profile.lastname
            );
        });

        const exec = async () => {
            return await request(server)
                .post("/api/walkers/profile")
                .set("x-auth-token", token)
                .send({ profile });
        };
        it("should return status 200 and token", async () => {
            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(200);
            expect(response.text).toBe("ok");
            expect(tkn).toBeDefined();
            expect(response.error).toBeFalsy();
        });

        it("should return status 401, no tkn", async () => {
            token = "";
            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(401);
            expect(tkn).toBeUndefined();
        });
        it("should return status 402, no tkn", async () => {
            profile.firstname = "";

            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(402);
            expect(tkn).toBeUndefined();
        });
        it("should return status 402, no tkn", async () => {
            profile.phone = "123456789";

            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(402);
            expect(tkn).toBeUndefined();
        });
    });
});
