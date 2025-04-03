const express = require('express');
const UserController = require('../controllers/userController');

const router = express.Router();

// Auth routes
router.post('/signin', UserController.signIn);
router.get('/', UserController.getUserDetails);

module.exports = router;