const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 3311;

app.use(bodyParser.json());

// Simulate successful payment (modify logic for different scenarios)
app.get('/', (req, res) => {
    res.json({ message: 'Stripe payment stub!', transactionId: 'simulated_id' });
});
app.post('/api/payment', (req, res) => {
  try {
    const { token, amount } = req.body;

    // Simulate payment processing logic
    const success = Math.random() > 0.5; // Simulate random chance of success

    if (success) {
      res.json({ message: 'Payment successful!', transactionId: 'simulated_id' });
    } else {
      res.status(500).json({ message: 'Payment failed' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

app.listen(port, () => console.log(`Server listening on port ${port}`));
