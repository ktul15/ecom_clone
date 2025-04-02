const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const UserModel = require('../models/userModel');

const UserController = {
  async signUp(req, res) {
    try {
      const { email, password } = req.body;

      // Check if the user already exists
      const existingUser = await UserModel.getUserByEmail(email);
      if (existingUser) {
        return res.status(400).json({ error: 'User already exists' });
      }

      // Hash the password
      const hashedPassword = await bcrypt.hash(password, 10);

      // Create the user
      const newUser = await UserModel.createUser(email, hashedPassword);
      res.status(201).json({ message: 'Account created successfully', user: newUser });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to create user' });
    }
  },

  async signIn(req, res) {
    try {
      const { email, password } = req.body;

      // Fetch the user by email
      const user = await UserModel.getUserByEmail(email);
      if (!user) {
        return res.status(401).json({ error: 'Invalid email or password' });
      }

      // Compare the hashed password
      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res.status(401).json({ error: 'Invalid email or password' });
      }

      // Generate a JWT token
      const token = jwt.sign({ id: user.id, email: user.email }, process.env.JWT_SECRET, {
        expiresIn: '1h',
      });

      res.status(200).json({ message: 'Sign-in successful', token });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to sign in' });
    }
  },
};

module.exports = UserController;