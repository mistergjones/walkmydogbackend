const request = require("supertest");


let server;

describe("/api/users", () => {

    beforeEach(() => { server = require("../../../index") });
    afterEach(() => { server.close() });
    describe("/api/users/login", () => {

        it("should return status 200  and return token", async () => {
            const email = "profileuser@ph.com";
            const password = "111";

            const response = await request(server)
                .post("/api/users/login")
                .send({ email, password });

            const token = response["headers"]["x-auth-token"];
            expect(response.status).toBe(200);
            expect(token).toBeDefined();
            expect(response.error).toBeFalsy();

        });
        it("should return status 400 no token no error", async () => {
            const email = "invaliduser@mail.com";
            const password = "111";

            const response = await request(server)
                .post("/api/users/login")
                .send({ email, password });

            const token = response["headers"]["x-auth-token"];
            expect(response.status).toBe(400);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();

        });
        it("should return status password error 400 no token no error", async () => {
            const email = "profileuser@ph.com";
            const password = "1112";

            const response = await request(server)
                .post("/api/users/login")
                .send({ email, password });

            const token = response["headers"]["x-auth-token"];
            expect(response.status).toBe(400);
            expect(token).toBeUndefined();
            expect(response.error).not.toBeFalsy();

        });
    });
});