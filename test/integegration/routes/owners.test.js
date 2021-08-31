const request = require("supertest");
const User = require("../../../models/owner");

var crypto = require("crypto");

let server;

describe("/api/owners POST", () => {
    beforeEach(() => {
        server = require("../../../index");
    });
    afterEach(() => {
        server.close();
    });

    // do an owner login
    describe("/api/owners/profile POST", () => {
        let profile;
        let token;

        beforeEach(() => {
            profile = {
                id: 79,
                type: "O",
                email: "gjgj@gj.com.com",
                firstname: "Pen",
                lastname: "Smith",
                streetAddress: "100 smith st",
                suburb: "Essendon",
                state: "VIC",
                postcode: "3030",
                // mobile: `${Math.floor(Math.random() * 10000000000)}`,
                mobile: `${parseInt(Math.random().toString().slice(2, 12))}`,
                dob: "1990-03-16",
                driverLicence: "1111111111",
                bankName: "CBA",
                bsb: "803126",
                accountNumber: 121212,
                dogName: "Brutus",
                dogBreed: "Forgi",
                dogSize: "S",
                requiresLeash: "Y",
                acceptTerms: "TRUE",
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
                .post("/api/owners/profile")
                .set("x-auth-token", token)
                .send({ profile });
        };
        it("should return status 200 and token", async () => {
            console.log(
                "START OF TEST 1 START OF TEST 1 - Ensure correct data so correct TOKEN"
            );
            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(200);
            expect(response.text).toBe("ok");
            expect(tkn).toBeDefined();
            expect(response.error).toBeFalsy();
            console.log("END OF TEST 1 END OF TEST 1");
        });

        it("should return status 401, no tkn", async () => {
            console.log(
                "START OF TEST 2 START OF TEST 2 - Ensure Token is BLANK"
            );
            token = "";
            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(401);
            expect(tkn).toBeUndefined();
            console.log("END OF TEST 2 END OF TEST 2");
        });
        it("should return status 402, no tkn", async () => {
            console.log("START OF TEST 3 START OF TEST 3 - Blank Firstname");
            profile.firstname = "";

            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(402);
            expect(tkn).toBeUndefined();
            console.log("END OF TEST 3 END OF TEST 3");
        });
        it("should return status 402, no tkn", async () => {
            console.log(
                "START OF TEST 4 START OF TEST 4 - Wrong length Mobile number"
            );
            profile.mobile = `${parseInt(
                Math.random().toString().slice(3, 12)
            )}`;

            const response = await exec();
            const tkn = response["headers"]["x-auth-token"];
            expect(response.status).toBe(402);
            expect(tkn).toBeUndefined();
            console.log("END OF TEST 4 END OF TEST 4");
        });
    });
});
