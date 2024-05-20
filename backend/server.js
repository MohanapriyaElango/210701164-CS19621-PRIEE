const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const loginRoutes = require('./routes/loginRoutes');
const donorRoutes = require('./routes/donorRoutes');
const foodRoutes = require('./routes/foodRoutes');
const Donor = require('./models/Donor');


const app = express();

//////////////////////////////////////////////

mongoose.connect('mongodb+srv://dhanushvenkatesan4:12345@cluster0.nenjft4.mongodb.net/Sample?retryWrites=true&w=majority&appName=Cluster0');

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB');
});
//////////////////////////////////////////////

app.use(bodyParser.json());


app.use('/api', loginRoutes);
app.use('/api', donorRoutes);
app.use('/api', foodRoutes);

///////////////////////////////////////////////

// const newDonor = new Donor({
//   name: 'Zoro',
//   organisationName: '12345',
//   password: '123',
//   location: 'Chennai',
//   emailId: 'a@123.com', // Make sure this is unique and not null
//   phoneNumber: '1234567890',
//   isDonor: true
// });

// newDonor.save()
//   .then(doc => {
//     console.log("Document inserted successfully:", doc);
//   })
//   .catch(err => {
//     if (err.code === 11000) {
//       console.error("Duplicate key error:", err);
//     } else {
//       console.error("Error inserting document:", err);
//     }
//   });


const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
