// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
const { logger } = require("firebase-functions");
const { onRequest } = require("firebase-functions/v2/https");

// Cloud Function to generate a random number
exports.generateRandomNumber = onRequest((req, res) => {
    // Generate a random number between 0 and 100
    const randomNumber = Math.floor(Math.random() * 101);

    // Log the random number (optional)
    logger.info(`Generated random number: ${randomNumber}`);

    // Send the random number as a response
    res.status(200).send({ number: randomNumber });
});
