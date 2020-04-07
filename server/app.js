const express = require('express'),
app = express(),
bodyparser = require('body-parser');
port = process.env.PORT || 3000;

const route = require('./routes/index');
route(app);

app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());
  

app.listen(port);
console.log('API server started on: ' + port);