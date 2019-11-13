const express = require("express");
const path = require("path");
const cors = require ('cors'); 

const app = express();
const port = process.env.PORT || "8000";


const cors = require ('cors'); 

app.get("/", (req, res) => {
  console.log('recibiendo petición');

  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify({ text: "PETICION" }));
});

app.listen(port, () => {
  console.log(`Listening to requests on http://localhost:${port}`);


});