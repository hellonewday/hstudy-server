const supertest = require("supertest");
const os = require("os");
const should = require("should");
const connection = require("../connection");

const server = supertest.agent(
  os.platform() === "win32" ? "http://localhost:8088" : "http://203.171.21.65:8088"
);

describe("/courses", () => {
  it("return courses list", (done) => {
    server
      .get("/courses")
      .expect(200)
      .expect("Content-Type", "application/json; charset=utf-8")
      .end((err, res) => {
        if (err) return done(err);
        res.status.should.equal(200);
        should(res.body).be.an.Object();
        res.body.should.have.property("result");
        res.should.be.json;
        done();
      });
  });

  it("return search courses list", (done) => {
    server
      .get("/courses")
      .send({ q: "Java" })
      .expect(200)
      .expect("Content-Type", "application/json; charset=utf-8")
      .end((err, res) => {
        if (err) return done(err);
        res.status.should.equal(200);
        should(res.body).be.an.Object();
        res.body.should.have.property("result");
        res.should.be.json;
        done();
      });
  });
});

// describe("business logic /courses ", () => {});
