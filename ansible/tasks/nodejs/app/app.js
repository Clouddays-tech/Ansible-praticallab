// Simple Express web server.
// @see http://howtonode.org/getting-started-with-express

// Load the express module.
var express = require('express');
var app = express();

// Respond to requests for / with 'Hello World'.
app.get('/', function(req, res){
    res.send('Hello Clouddays!');
});

// // Listen on port 80 (like a true web server).
// app.listen(80, () => console.log('Express server started successfully.'));

// Listen on port 80 on all network interfaces.
app.listen(80, '0.0.0.0', () => {
    console.log('Express server started successfully on port 80, accessible from all network interfaces.');
  });