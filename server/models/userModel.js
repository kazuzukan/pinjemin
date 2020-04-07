const sql = require("./db");

//constructor
const User = (user) => {
  this.id = user.id;
  this.first_name = user.first_name;
  this.last_name = user.last_name;
  this.address = user.address;
  this.phone = user.phone;
  this.gender = user.gender;
  this.email = user.email;
  this.password = user.password;
  this.point = user.point;
  this.is_ambassador = user.is_ambassador;
};

// Get all User
User.getAll = (result) => {
  sql.query("SELECT * FROM user", (err, res) => {
    if (err) {
      console.log("error :", err);
      result(null, err);
      return;
    }
    console.log("user: ", res);
    result(null, res);
  });
};

//Get User by Id
User.getById = (userId, result) => {
  sql.query(`SELECT * FROM user WHERE id = ${userId}`, (err, res) => {
    if (err) {
      console.log("error : ", err);
      result(null, err);
      return;
    }
    if (res.length) {
      console.log(res.length)
      result(null, res);
      return;
    }
    result({ not: "not_found" }, null);
  });
};

module.exports = User;
