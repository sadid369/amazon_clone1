console.log("Hello World");
const express = require("express");
const PORT = 3000;
const app = express();
//CREATING AN API
//GET, PUT, POST , DELETE, UPDATE -> CRUD
// http://<youripaddress>/hello-wrold
app.get("/hello-world", (req, res) => {
  res.json({ hi: "Hello World" });
});
app.get("/", (req, res) => {
  res.json({ Name: "Sadid" });
});

app.listen(PORT, () => {
  console.log(`Connected at port ${PORT} `);
});
