const express = require("express");
const mongoose = require("mongoose");

const app = express();
app.use(express.json());

// Connect to MongoDB
mongoose.connect("mongodb://mongodb:27017/devopsdb", {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => console.log("MongoDB Connected"))
.catch(err => console.log(err));

// Schema
const ItemSchema = new mongoose.Schema({
  name: String
});

const Item = mongoose.model("Item", ItemSchema);

// Routes

// Add data
app.post("/api/items", async (req, res) => {
  const item = new Item({ name: req.body.name });
  await item.save();
  res.json(item);
});

// Get data
app.get("/api/items", async (req, res) => {
  const items = await Item.find();
  res.json(items);
});

app.listen(5000, () => {
  console.log("Backend running on port 5000");
});