const express = require('express');
const bodyParser = require('body-parser');
const app = express(),

port = process.env.PORT || 3000;

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

const route = require('./routes/index');
route(app);

app.listen(port);
console.log('API server started on: ' + port);