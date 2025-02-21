import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Login from './components/Login';
import CbtHuman from './components/CbtHuman';
import CbtAi from './components/CbtAi';
import Mindfulness from './components/Mindfulness';
import EmotionalAssessment from './components/EmotionalAssessment';
import Chatbot from './components/Chatbot';
import HomePage from './components/HomePage';

const App = () => {
    return (
        <Router>
            <div>
                 <h1>EUNOIA</h1>

                <Routes>
                    <Route path="/" element={<Login />} />
                    <Route path="/cbt-human" element={<CbtHuman />} />
                    <Route path="/cbt-ai" element={<CbtAi />} />
                    <Route path="/mindfulness" element={<Mindfulness />} />
                    <Route path="/emotional-assessment" element={<EmotionalAssessment />} />
                    <Route path="/chatbot" element={<Chatbot />} />
                    <Route path="/home" element={<HomePage />} />
                </Routes>
            </div>
        </Router>
    );
};

export default App;