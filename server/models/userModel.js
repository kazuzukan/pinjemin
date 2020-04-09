const sql = require("./db");

//constructor
class User {
  constructor(user) {
    this.first_name = user.first_name;
    this.last_name = user.last_name;
    this.address = user.address;
    this.phone = user.phone;
    this.gender = user.gender;
    this.email = user.email;
    this.password = user.password;
    this.point = user.point;
    this.is_ambassador = user.is_ambassador;
  }

  // Get all User
  static getAll(result) {
    sql.query("SELECT * FROM user", (err, res) => {
      if (err) {
        console.log("error :", err);
        result(null, err);
        return;
      }
      console.log("user: ", res);
      result(null, res);
    });
  }
  //Get User by Id
  static getById(userId, result) {
    sql.query(`SELECT * FROM user WHERE id = ${userId}`, (err, res) => {
      if (err) {
        console.log("error : ", err);
        result(null, err);
        return;
      }
      if (res.length) {
        console.log(res.length);
        result(null, res);
        return;
      }
      result({ not: "not_found" }, null);
    });
  }
  //Create User
  static creareUser(newCustomer, result) {
    sql.query("INSERT INTO user SET ?", newCustomer, (err, res) => {
      if (err) {
        console.log("error :", err);
        result(err, null);
        return;
      }
      result(null, { id: res.insertId, ...newCustomer });
    });
  }
}




module.exports = User;
