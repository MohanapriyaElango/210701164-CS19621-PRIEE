const mongoose = require('mongoose');

const addFoodSchema = new mongoose.Schema({

  foodName: { type: String, required: true },
  emailId: { type: String, required: true },
  organisationName: { type: String },
  quantity: { type: String, required: true },
  dateTime: { type: Date, default: Date.now },
  location: { type: String, required: true },
  link: { type: String },
  foodstatus: { type: Number },
  recv_emailId: { type: String, required: true }
  
});

const AddFood = mongoose.model('AddFood', addFoodSchema);

module.exports = AddFood;
