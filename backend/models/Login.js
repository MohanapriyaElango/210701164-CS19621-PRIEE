const mongoose = require('mongoose');

const loginSchema = new mongoose.Schema({
  emailId: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  userid: { type: mongoose.Schema.Types.ObjectId, required: true }
});

const Login = mongoose.model('Login', loginSchema);

module.exports = Login;
