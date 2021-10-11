const request = require("supertest");
const User = require("../../../models/user");

var crypto = require("crypto");

let server;

describe("/api/users POST", () => {
    beforeEach(() => {
        server = require("../../../index");
    });
    afterEach(() => {
        server.close();
    });

    describe("/api/users/login", () => {
        let email;
        let password;

        beforeEach(() => {
            email = "profileuser@ph.com";
            password = "111";
        });

        const exec = async () => {
            return await request(server)
                .post("/api/users/login")
                .send({ email, password });
        };
        it("should return status 200  and return token", async () => {
            const response = await exec();
            const token = response["headers"]["x-auth-token"];
            expect(response.status).toBe(200);
            expect(token).toBeDefined();
            expect(response.error).toBeFalsy();
        });

        it("should return 400 login email error", async () => {
            email = "aa";

            const response = await exec();

            expect(response.status).toBe(400);
            expect(response.error).not.toBeFalsy();
        });

        it("should return 400 login password error", async () => {
            password = "";

            const response = await exec();

            expect(response.status).toBe(400);
            expect(response.error).not.toBeFalsy();
        });

        it("should return status 400 no token no error", async () => {
            email = "invaliduser@mail.com";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(400);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
        it("should return status 400 and password error  no token ", async () => {
            password = "1112";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(400);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
    });

    describe("/api/users/ POST", () => {
        let email;
        let password;
        let type;
        let firstname;
        let lastname;

        beforeEach(() => {
            // email = `newuser@ph${Math.floor(Math.random() * 1000000)}.com`;
            email = `newuser@ph${crypto.randomBytes(8).toString("hex")}.com`;
            password = "111";
            type = "W";
            firstname = "John";
            lastname = "Smith";
        });
        const exec = async () => {
            return await request(server)
                .post("/api/users/")
                .send({ email, password, type, firstname, lastname });
        };

        it("Should return status 200 , token, no error", async () => {
            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(200);

            expect(token).toBeDefined();
            expect(response.error).toBeFalsy();
        });
        it("Should return status 400 , no token, and error", async () => {
            email = "profileuser@ph.com";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(400);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
        it("Should return status 402 , no token, and error invalid email", async () => {
            email = "profileuser@com";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(402);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
        it("Should return status 402 , no token, and error invalid password", async () => {
            password = "";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(402);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
        it("Should return status 402 , no token, and error invalid password", async () => {
            const longEmail = new Array(150).join("a");
            email = longEmail + "@mail.com";

            const response = await exec();
            const token = response["headers"]["x-auth-token"];

            expect(response.status).toBe(402);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();
        });
    });
});
