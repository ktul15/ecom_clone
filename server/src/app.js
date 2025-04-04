const express = require('express');
const routes = require('./routes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use("/api/v1/auth", routes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
})