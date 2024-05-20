const mongoose = require('mongoose');

const donorSchema = new mongoose.Schema({
  name: { type: String, required: true },
  organisationName: { type: String },
  password: { type: String, required: true },
  location: { type: String },
  emailId: { type: String, required: true, unique: true },
  phoneNumber: { type: String },
  isDonor: { type: Boolean, default: true }
});

const Donor = mongoose.model('Donor', donorSchema);

module.exports = Donor;