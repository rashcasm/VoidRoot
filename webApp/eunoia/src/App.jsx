import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Login from './components/Login';
import CbtHuman from './components/CbtHuman';
import CbtAi from './components/CbtAi';
import Mindfulness from './components/Mindfulness';
import EmotionalAssessment from './components/EmotionalAssessment';
import Chatbot from './components/Chatbot';

const App = () => {
    return (
        <Router>
            <div>
                <h1>Therapy App Navigation</h1>
                <nav>
                    <Link to="/">
                        <button>Login</button>
                    </Link>
                    <Link to="/cbt-human">
                        <button>Cognitive Behavioral Therapy (Counsellor)</button>
                    </Link>
                    <Link to="/cbt-ai">
                        <button>Cognitive Behavioral Therapy (AI)</button>
                    </Link>
                    <Link to="/mindfulness">
                        <button>Mindfulness Exercises</button>
                    </Link>
                    <Link to="/emotional-assessment">
                        <button>Emotional Assessments</button>
                    </Link>
                    <Link to="/chatbot">
                        <button>Chatbot Support</button>
                    </Link>
                </nav>
                <Routes>
                    <Route path="/" element={<Login />} />
                    <Route path="/cbt-human" element={<CbtHuman />} />
                    <Route path="/cbt-ai" element={<CbtAi />} />
                    <Route path="/mindfulness" element={<Mindfulness />} />
                    <Route path="/emotional-assessment" element={<EmotionalAssessment />} />
                    <Route path="/chatbot" element={<Chatbot />} />
                </Routes>
            </div>
        </Router>
    );
};

export default App;