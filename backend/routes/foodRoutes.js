const express = require('express');
const router = express.Router();
const AddFood = require('../models/Addfood');

///////////////////////////////////////////////////////////////////////////////

router.post('/addfood', async (req, res) => {
  const { foodName, emailId, organisationName, quantity, location, link, foodstatus, recv_emailId } = req.body;
  console.log(foodName);
  try {
    const newFoodItem = new AddFood({
      emailId,
      quantity,
      foodName,
      organisationName,
      foodstatus,
      location,
      link,
      recv_emailId
    });

    console.log(newFoodItem);
    await newFoodItem.save();

    res.status(201).json({ message: 'Food item added successfully' });

  } catch (error) {
    console.error('Error adding food item:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

///////////////////////////////////////////////////////////////////////////////

router.post('/updateFoodStatus/:id', async (req, res) => {
  const { id } = req.params;
  const { foodstatus } = req.body;

  try {
    const food = await AddFood.findByIdAndUpdate(id, { foodstatus }, { new: true });

    if (!food) {
      return res.status(404).json({ message: 'Food item not found' });
    }

    res.status(200).json({ message: 'Food status updated successfully', food });
  } catch (error) {
    console.error('Error updating food status:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

///////////////////////////////////////////////////////////////////////////////

router.post('/fooditems', async (req, res) => {
  try {
    const foodItems = await AddFood.find();
    res.status(200).json({ foodItems });
  } catch (error) {
    console.error('Error fetching food items:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

///////////////////////////////////////////////////////////////////////////////

router.post('/fooditems/:id', async (req, res) => {
  const foodItemId = req.params.id;

  try {
    const deletedFoodItem = await AddFood.findByIdAndDelete(foodItemId);

    if (!deletedFoodItem) {
      return res.status(404).json({ message: 'Food item not found' });
    }

    res.status(200).json({ message: 'Food item deleted successfully' });
  } catch (error) {
    console.error('Error deleting food item:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

//////////////////////////////////////////////////////////////////////////////

router.post('/foodItemsWithStatusMinusOne', async (req, res) => {
  try {
    
    const foodItems = await AddFood.find({ foodstatus: -1 });

    if (!foodItems || foodItems.length === 0) {
      return res.status(404).json({ message: 'No food items found with status -1' });
    }

    res.status(200).json({ foodItems });
  } catch (error) {
    console.error('Error fetching food items with status -1:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

//////////////////////////////////////////////////////////////////////////////

router.post('/foodItemsfind', async (req, res) => {
  const { emailId, foodstatus } = req.body;

  try {
    const foodItems = await AddFood.find({ emailId, foodstatus });

    if (!foodItems || foodItems.length === 0) {
      return res.status(404).json({ message: 'No food items found with the given email ID and status' });
    }

    res.status(200).json({ foodItems });
  } catch (error) {
    console.error('Error fetching food items:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});


//////////////////////////////////////////////////////////////////////////////




module.exports = router;
