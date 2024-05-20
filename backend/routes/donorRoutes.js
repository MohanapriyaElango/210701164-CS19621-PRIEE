const express = require('express');
const router = express.Router();
const Donor = require('../models/Donor');


router.post('/donor', async (req, res) => {
  const { emailId, password } = req.body;

  try {
    
    const donor = await Donor.findOne({ emailId });

    
    if (!donor || donor.password !== password) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }

    
    return res.status(200).json({ donor });
  } catch (error) {
    console.error('Error during login:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;
