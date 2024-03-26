// server.js



// Add this at the top of your server.js
const db = require('./database');

// Registration endpoint


const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json()); // For parsing application/json

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));


app.post('/registerExam', (req, res) => {
    const { adminName, adminEmail,adminPassword, examName, examTopics, totalTime} = req.body;
    const query = `INSERT INTO exams (admin_name, admin_email,admin_password, exam_name, exam_topics, total_time) VALUES (?, ?, ?, ?, ?, ?)`;
    
    db.query(query, [adminName, adminEmail,adminPassword, examName, examTopics, totalTime], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ message: 'Error registering exam', error: err.toString() });
            return;
        }
        res.status(200).json({ message: 'Exam registered successfully', examId: result.insertId });
    });
});

app.post('/add-question', (req, res) => {
    const { examId, question, options, correctAnswer, totalPoints, topic, difficulty } = req.body;
    const query = `INSERT INTO questions (exam_id, question, options, correct_answer, total_points, topic, difficulty) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    
    db.query(query, [examId, question, JSON.stringify(options), correctAnswer, totalPoints, topic, difficulty], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ message: 'Error adding question', error: err.toString() });
            return;
        }
        res.status(200).json({ message: 'Question added successfully' });
    });
});
app.post('/student-login', (req, res) => {
    const { email, password } = req.body;
    const query = "SELECT * FROM students WHERE email = ? AND password = ?";

    db.query(query, [email, password], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ success: false, message: "Database query error", error: err.toString() });
            return;
        }

        if (result.length > 0) {
            res.json({ success: true, message: "Login successful" });
        } else {
            res.status(401).json({ success: false, message: "Invalid credentials" });
        }
    });
});
app.post('/admin-login', (req, res) => {
    const { email, password } = req.body;
    const query = "SELECT * FROM exams WHERE admin_email = ? AND admin_password = ?";

    db.query(query, [email, password], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ success: false, message: "Database query error", error: err.toString() });
            return;
        }

        if (result.length > 0) {
            res.json({ success: true, message: "Login successful" });
        } else {
            res.status(401).json({ success: false, message: "Invalid credentials" });
        }
    });
});


app.post('/register', (req, res) => {
  const { name, email, password, educationLevel, educationStatus, completionYear, schoolName, major } = req.body;
  // Here you would typically hash the password before storing it
  const query = `INSERT INTO students (name, email, password, educationLevel, educationStatus, completionYear, schoolName, major) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(query, [name, email, password, educationLevel, educationStatus, completionYear, schoolName, major], (err, result) => {
    if (err) {
      // Don't throw the error, instead send a JSON response with the error
      console.error(err);
      res.status(500).json({ message: 'Error registering user', error: err });
    } else {
      // Send a JSON response indicating success
      res.status(200).json({ message: 'Registration successful',examId: result.insertId });
    }
  });
});

app.get('/student-details/:studentId', (req, res) => {
    const { studentId } = req.params;
    const query = "SELECT * FROM students WHERE id = ?";
    
    db.query(query, [studentId], (err, results) => {
        if (err) {
            console.error('Error fetching student details:', err);
            res.status(500).json({ message: "Error fetching student details", error: err });
        } else if (results.length > 0) {
            
            res.json(results[0]);
        } else {
            // If no results, the student was not found
            res.status(404).json({ message: "Student not found" });
        }
    });
});
