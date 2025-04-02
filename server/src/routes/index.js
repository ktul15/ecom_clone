const express = require('express');
const UserController = require('../controllers/userController');

const router = express.Router();

// Auth routes
router.post('/signUp', UserController.signUp);
router.post('/signIn', UserController.signIn);

module.exports = router;