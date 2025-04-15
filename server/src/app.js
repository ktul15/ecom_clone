const express = require('express');
const frontRoutes = require('./routes/front/auth');
const adminRoutes = require('./routes/admin/auth');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use("/ecom_clone/api/v1/auth", frontRoutes);
app.use("/ecom_clone/api/v1/admin", adminRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
})