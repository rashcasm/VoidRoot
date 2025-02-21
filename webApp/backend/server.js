// backend/server.js
const express = require('express');
const http = require('http');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);
const cors = require('cors');

app.use(cors());
app.use(express.json());

// MongoDB connection
const MONGODB_URI = 'mongodb+srv://rashminnotfound:rash@cluster0.kh5im.mongodb.net/';
mongoose.connect(MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => console.log(err));

// User model
const UserSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    emotionalScore: { type: Number, default: 0 } // Add this line
});
const User = mongoose.model('User', UserSchema);

// Register route
app.post('/api/register', async (req, res) => {
    const { username, password } = req.body;
    const newUser = new User({ username, password }); // Store plain text password
    try {
        await newUser.save();
        res.status(201).send('User registered');
    } catch (error) {
        res.status(400).send('Error registering user: ' + error.message);
    }
});

// Login route
app.post('/api/login', async (req, res) => {
    const { username, password } = req.body;
    const user = await User.findOne({ username });
    if (!user) return res.status(400).send('User not found');
    if (user.password !== password) return res.status(400).send('Invalid credentials'); // Check plain text password
    res.send('Login successful');
});


app.post('/api/save-score', async (req, res) => {
    const { score, username } = req.body;
    console.log('Received score:', req.body);
    try {
        // Update the user's score in the database based on the username
        await User.updateOne({ username: username }, { $set: { emotionalScore: score } });
        res.send('Score saved successfully');
    } catch (error) {
        res.status(400).send('Error saving score: ' + error.message);
    }
});

io.on('connection', (socket) => {
    console.log('New client connected');

    socket.on('offer', (offer) => {
        socket.broadcast.emit('offer', offer);
    });

    socket.on('answer', (answer) => {
        socket.broadcast.emit('answer', answer);
    });

    socket.on('ice-candidate', (candidate) => {
        socket.broadcast.emit('ice-candidate', candidate);
    });

    socket.on('disconnect', () => {
        console.log('Client disconnected');
    });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));