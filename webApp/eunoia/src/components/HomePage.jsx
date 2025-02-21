// eunoia/src/components/HomePage.jsx
import React from 'react';
import './HomePage.css'; // Import the CSS file

const HomePage = () => {
    return (
        <div className="homepage">
            <header className="header">
                <h1>Eunoia</h1>
            </header>
            <nav className="navbar">
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/emotional-assessment">Emotional Assessment</a></li>
                    <li><a href="/cbt-ai">Cognitive Behavioral Therapy (AI)</a></li>
                    <li><a href="/mindfulness">Mindfulness Exercises</a></li>
                    <li><a href="/cbt-human">Talk to a Counselor</a></li>
                </ul>
            </nav>
            <main className="content">
                <h2>About Eunoia</h2>
                <p>
                    Eunoia is a comprehensive mental health application designed to support individuals on their journey to emotional well-being. 
                    Our platform offers a variety of features, including emotional assessments, cognitive behavioral therapy, mindfulness exercises, 
                    and access to professional counselors.
                </p>
                <p>
                    We believe in the importance of mental health and aim to provide resources and support to help you navigate life's challenges. 
                    Explore our features and take the first step towards a healthier mind.
                </p>
            </main>
            <footer className="footer">
                <p>&copy; 2025 Eunoia. All rights reserved.</p>
                <p>
                    <a href="/privacy-policy">Privacy Policy</a> | <a href="/terms-of-service">Terms of Service</a>
                </p>
            </footer>
        </div>
    );
};

export default HomePage;