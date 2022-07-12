//IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
//IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
//INIT
const PORT = 3000;
const app = express();
//middleware
app.use(authRouter);
//Connections

app.listen(PORT, () => {
  console.log(`Connected at port ${PORT} `);
});
